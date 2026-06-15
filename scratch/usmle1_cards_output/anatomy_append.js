const anatomyAppendCards = [
  {
    "q": "What is the most common congenital anomaly of the kidney?",
    "a": "<b>Horseshoe kidney</b> (fusion at lower poles)."
  },
  {
    "q": "What is the most common site of ectopic kidney?",
    "a": "<b>Pelvic kidney</b>."
  },
  {
    "q": "What is the blood supply to the kidneys?",
    "a": "Renal arteries (direct branches of abdominal aorta at <b>L1–L2</b>)."
  },
  {
    "q": "What is the venous drainage of the kidneys?",
    "a": "<ul><li>Right renal vein → IVC.</li><li>Left renal vein → IVC (longer, receives left gonadal and adrenal veins).</li></ul>"
  },
  {
    "q": "What is the lymphatic drainage of the kidneys?",
    "a": "<b>Para-aortic</b> (lumbar) lymph nodes."
  },
  {
    "q": "What is the most common renal artery variation?",
    "a": "Multiple renal arteries (especially to lower pole)."
  },
  {
    "q": "What is the relationship of the right renal artery to the IVC?",
    "a": "Passes posterior to the IVC."
  },
  {
    "q": "What is the relationship of the left renal vein to the aorta?",
    "a": "Crosses anterior to the aorta (<b>nutcracker syndrome</b> risk)."
  },
  {
    "q": "What is the innervation of the kidneys?",
    "a": "Sympathetic from T10–L1 via renal plexus."
  },
  {
    "q": "<ol><li><b>Ureteropelvic junction</b> (UPJ)</li><li>Crossing of <b>common iliac artery</b></li><li><b>Ureterovesical junction</b> (UVJ)</li></ol>",
    "a": "<ol><li><b>Ureteropelvic junction</b> (UPJ)</li><li>Crossing of <b>common iliac artery</b></li><li><b>Ureterovesical junction</b> (UVJ)</li></ol>"
  },
  {
    "q": "What is the blood supply to the ureter?",
    "a": "Segmental: renal, gonadal, common iliac, <b>internal iliac</b>, and vesical arteries."
  },
  {
    "q": "What is the lymphatic drainage of the ureter?",
    "a": "Follows arterial supply."
  },
  {
    "q": "What is the most common site of ureteric injury during surgery?",
    "a": "At the level where <b>uterine artery</b> crosses the ureter ('water under the bridge')."
  },
  {
    "q": "What is the blood supply to the bladder?",
    "a": "Superior and inferior vesical arteries (from <b>internal iliac</b>)."
  },
  {
    "q": "What is the innervation of the <b>detrusor muscle</b>?",
    "a": "Parasympathetic (pelvic splanchnic nerves S2–S4)."
  },
  {
    "q": "What is the innervation of the <b>internal urethral sphincter</b>?",
    "a": "Sympathetic (hypogastric nerves)."
  },
  {
    "q": "What is the innervation of the <b>external urethral sphincter</b>?",
    "a": "<b>Pudendal nerve</b> (S2–S4, somatic)."
  },
  {
    "q": "What is the <b>trigone</b> of the bladder?",
    "a": "Smooth triangular area between ureteric orifices and internal urethral orifice."
  },
  {
    "q": "What is the embryonic origin of the <b>trigone</b>?",
    "a": "Mesoderm (absorbed mesonephric ducts)."
  },
  {
    "q": "What is the most common site of bladder cancer?",
    "a": "Lateral walls and <b>trigone</b>."
  },
  {
    "q": "What is the blood supply to the prostate?",
    "a": "Inferior vesical artery and middle rectal artery."
  },
  {
    "q": "What is the venous drainage of the prostate?",
    "a": "<b>Prostatic venous plexus → internal iliac veins (Batson's plexus</b> — route for metastasis to vertebrae)."
  },
  {
    "q": "What is the lymphatic drainage of the prostate?",
    "a": "<b>Internal iliac</b> and sacral nodes."
  },
  {
    "q": "What is the innervation of the prostate?",
    "a": "Parasympathetic (pelvic splanchnics) for erection; sympathetic for ejaculation."
  },
  {
    "q": "<ul><li><b>Peripheral zone</b> — most cancers (70%)</li><li><b>Central zone</b></li><li><b>Transition zone</b> — BPH</li></ul>",
    "a": "<ul><li><b>Peripheral zone</b> — most cancers (70%)</li><li><b>Central zone</b></li><li><b>Transition zone</b> — BPH</li></ul>"
  },
  {
    "q": "What is the blood supply to the testes?",
    "a": "Testicular arteries (direct from abdominal aorta at L2)."
  },
  {
    "q": "What is the venous drainage of the testes?",
    "a": "<ul><li><b>Right:</b> testicular vein → IVC.</li><li><b>Left:</b> testicular vein → left renal vein.</li></ul>"
  },
  {
    "q": "What is the lymphatic drainage of the testes?",
    "a": "<b>Para-aortic</b> (lumbar) lymph nodes."
  },
  {
    "q": "What is the innervation of the scrotum?",
    "a": "<ul><li><b>Anterior:</b> ilioinguinal nerve.</li><li><b>Posterior:</b> perineal branch of pudendal nerve.</li></ul>"
  },
  {
    "q": "What is the blood supply to the penis?",
    "a": "Internal pudendal artery → dorsal artery, deep artery, and artery to bulb."
  },
  {
    "q": "What is the venous drainage of the penis?",
    "a": "Deep dorsal vein → prostatic plexus."
  },
  {
    "q": "<ul><li><b>Erection:</b> Parasympathetic (pelvic splanchnics S2–S4)</li><li><b>Ejaculation:</b> Sympathetic (hypogastric nerves)</li></ul><b>Mnemonic:</b> <i>Point</i> (parasympathetic) and <i>Shoot</i> (sympathetic).",
    "a": "<ul><li><b>Erection:</b> Parasympathetic (pelvic splanchnics S2–S4)</li><li><b>Ejaculation:</b> Sympathetic (hypogastric nerves)</li></ul><b>Mnemonic:</b> <i>Point</i> (parasympathetic) and <i>Shoot</i> (sympathetic)."
  },
  {
    "q": "What is the blood supply to the ovary?",
    "a": "Ovarian artery (from aorta) + ovarian branch of <b>uterine artery</b>."
  },
  {
    "q": "What is the venous drainage of the ovary?",
    "a": "<ul><li><b>Right:</b> ovarian vein → IVC.</li><li><b>Left:</b> ovarian vein → left renal vein.</li></ul>"
  },
  {
    "q": "What is the lymphatic drainage of the ovary?",
    "a": "<b>Para-aortic</b> (lumbar) nodes."
  },
  {
    "q": "What is the blood supply to the uterus?",
    "a": "<b>Uterine artery</b> (branch of <b>internal iliac</b>)."
  },
  {
    "q": "What is the relationship of the ureter to the <b>uterine artery</b>?",
    "a": "Ureter passes under the <b>uterine artery</b> ('water under the bridge')."
  },
  {
    "q": "What is the lymphatic drainage of the uterine fundus?",
    "a": "<b>Para-aortic</b> nodes (via ovarian vessels)."
  },
  {
    "q": "What is the lymphatic drainage of the cervix?",
    "a": "Internal and external iliac nodes."
  },
  {
    "q": "What is the most common site of aortic aneurysm?",
    "a": "<b>Infrarenal</b> abdominal aorta."
  },
  {
    "q": "What is the most common site of aortic dissection?",
    "a": "<b>Ascending aorta</b> (just above aortic valve)."
  },
  {
    "q": "What is the blood supply to the spinal cord?",
    "a": "<b>Anterior spinal artery</b> (from vertebral arteries) and <b>posterior spinal arteries</b> + radicular arteries (including <b>Artery of Adamkiewicz</b>)."
  },
  {
    "q": "What is the <b>Artery of Adamkiewicz</b>?",
    "a": "Major radicular artery supplying lower 2/3 of spinal cord (usually from left T9–T12)."
  },
  {
    "q": "<b>Anterior Spinal Artery Syndrome:</b><ul><li>Bilateral <b>loss of motor function</b> (corticospinal tract)</li><li>Bilateral <b>loss of pain and temperature</b> (spinothalamic tract)</li><li><b>Preserved proprioception and vibration</b> (dorsal columns)</li></ul>",
    "a": "<b>Anterior Spinal Artery Syndrome:</b><ul><li>Bilateral <b>loss of motor function</b> (corticospinal tract)</li><li>Bilateral <b>loss of pain and temperature</b> (spinothalamic tract)</li><li><b>Preserved proprioception and vibration</b> (dorsal columns)</li></ul>"
  },
  {
    "q": "What is the venous drainage of the spinal cord?",
    "a": "Anterior and posterior spinal veins → vertebral venous plexus (<b>Batson's plexus</b>)."
  },
  {
    "q": "What is the clinical significance of <b>Batson's plexus</b>?",
    "a": "Valveless communication between pelvic veins and vertebral veins → route for prostate/breast cancer metastasis to spine."
  },
  {
    "q": "What are the boundaries of the posterior triangle of the neck?",
    "a": "<ul><li><b>Anterior:</b> sternocleidomastoid</li><li><b>Posterior:</b> trapezius</li><li><b>Inferior:</b> clavicle.</li></ul>"
  },
  {
    "q": "<ul><li><b>Accessory nerve (CN XI)</b></li><li><b>Brachial plexus trunks</b></li><li><b>Subclavian artery</b></li><li><b>External jugular vein</b></li></ul>",
    "a": "<ul><li><b>Accessory nerve (CN XI)</b></li><li><b>Brachial plexus trunks</b></li><li><b>Subclavian artery</b></li><li><b>External jugular vein</b></li></ul>"
  },
  {
    "q": "What is the most common nerve injured in neck dissection?",
    "a": "<b>Spinal <b>accessory nerve</b></b> (CN XI) → <b>trapezius</b> paralysis."
  },
  {
    "q": "What is the <b>ansa cervicalis</b>?",
    "a": "Nerve loop from C1–C3 supplying infrahyoid muscles (except thyrohyoid)."
  },
  {
    "q": "What is the innervation of the diaphragm?",
    "a": "<b>Phrenic nerve</b> (C3–C5)."
  },
  {
    "q": "What is the clinical sign of unilateral <b>phrenic nerve</b> injury?",
    "a": "Elevated hemidiaphragm on chest X-ray."
  },
  {
    "q": "<ul><li><b>T8</b> — Caval opening (<b>IVC</b>)</li><li><b>T10</b> — Esophageal hiatus (<b>esophagus</b> + <b>vagus nerves</b>)</li><li><b>T12</b> — Aortic hiatus (<b>aorta</b>, thoracic duct, azygos vein)</li></ul><b>Mnemonic:</b> I (8) ate (10) eggs (12) at the table.",
    "a": "<ul><li><b>T8</b> — Caval opening (<b>IVC</b>)</li><li><b>T10</b> — Esophageal hiatus (<b>esophagus</b> + <b>vagus nerves</b>)</li><li><b>T12</b> — Aortic hiatus (<b>aorta</b>, thoracic duct, azygos vein)</li></ul><b>Mnemonic:</b> I (8) ate (10) eggs (12) at the table."
  },
  {
    "q": "What is the most common type of diaphragmatic hernia in adults?",
    "a": "<b>Hiatal hernia</b> (sliding type most common)."
  },
  {
    "q": "What is <b>Bochdalek hernia</b>?",
    "a": "Congenital posterolateral diaphragmatic hernia (usually left side)."
  },
  {
    "q": "What is <b>Morgagni hernia</b>?",
    "a": "Congenital anterior diaphragmatic hernia (retrosternal)."
  },
  {
    "q": "What is the most common site of lumbar puncture?",
    "a": "<b>L3–L4</b> or <b>L4–L5</b> interspace (below termination of spinal cord)."
  },
  {
    "q": "<ol><li>Skin</li><li>Subcutaneous tissue</li><li><b>Supraspinous ligament</b></li><li><b>Interspinous ligament</b></li><li><b>Ligamentum flavum</b></li><li>Epidural space</li><li><b>Dura mater</b></li><li><b>Arachnoid mater</b></li><li><b>Subarachnoid space</b> (CSF)</li></ol>",
    "a": "<ol><li>Skin</li><li>Subcutaneous tissue</li><li><b>Supraspinous ligament</b></li><li><b>Interspinous ligament</b></li><li><b>Ligamentum flavum</b></li><li>Epidural space</li><li><b>Dura mater</b></li><li><b>Arachnoid mater</b></li><li><b>Subarachnoid space</b> (CSF)</li></ol>"
  },
  {
    "q": "What is the termination level of the spinal cord in adults?",
    "a": "<b>L1–L2</b> (<b>conus medullaris</b>)."
  },
  {
    "q": "What is the termination level of the dural sac?",
    "a": "S2."
  },
  {
    "q": "What is the <b>cauda equina</b>?",
    "a": "Bundle of lumbar and sacral nerve roots below <b>L1–L2</b>."
  },
  {
    "q": "What is the blood supply to the anterior 2/3 of the spinal cord?",
    "a": "<b>Anterior spinal artery</b>."
  },
  {
    "q": "What is the blood supply to the posterior 1/3 of the spinal cord?",
    "a": "<b>Posterior spinal arteries</b>."
  },
  {
    "q": "What is the clinical importance of the <b>epidural space</b>?",
    "a": "Site for epidural anesthesia."
  },
  {
    "q": "What is the clinical importance of the <b>subarachnoid space</b>?",
    "a": "Contains CSF; site for lumbar puncture and spinal anesthesia."
  },
  {
    "q": "What are the major contents of the <b>carotid sheath</b>?",
    "a": "Common carotid artery, internal jugular vein, <b>vagus nerve</b> (CN X)."
  },
  {
    "q": "What is the clinical significance of the <b>carotid body</b>?",
    "a": "Chemoreceptor sensing O₂, CO₂, and pH."
  },
  {
    "q": "What is the clinical significance of the <b>carotid sinus</b>?",
    "a": "Baroreceptor regulating blood pressure."
  },
  {
    "q": "What nerve innervates the <b>carotid sinus</b> and body?",
    "a": "<b>Glossopharyngeal nerve</b> (CN IX) via <b>carotid sinus</b> nerve (Hering's nerve)."
  },
  {
    "q": "What is the most common site of <b>berry aneurysm</b>?",
    "a": "<b>Anterior communicating artery</b>."
  },
  {
    "q": "What is the most common cause of <b>subarachnoid hemorrhage</b>?",
    "a": "Ruptured berry (saccular) aneurysm."
  },
  {
    "q": "What is the most common site of <b>epidural hematoma</b>?",
    "a": "<b>Middle meningeal artery</b> (temporal bone fracture)."
  },
  {
    "q": "What is the most common site of <b>subdural hematoma</b>?",
    "a": "<b>Bridging veins</b>."
  },
  {
    "q": "What is the most common site of <b>intracerebral hemorrhage</b> in hypertensives?",
    "a": "<b>Basal ganglia</b> (<b>putamen</b>)."
  }
];

module.exports = { anatomyAppendCards };
