const anatomyCards = [
  {
    "q": "What are the boundaries of the axilla?",
    "a": "<ul><li><b>Anterior:</b> pectoralis major/minor</li><li><b>Posterior:</b> subscapularis, teres major, latissimus dorsi</li><li><b>Medial:</b> serratus anterior</li><li><b>Lateral:</b> bicipital groove of humerus</li></ul>"
  },
  {
    "q": "What structures pass through the thoracic outlet?",
    "a": "Subclavian artery, subclavian vein, brachial plexus (lower trunk), sympathetic chain."
  },
  {
    "q": "What is the most common site of thoracic outlet syndrome compression?",
    "a": "Between anterior and middle scalene muscles (scalene triangle) or costoclavicular space."
  },
  {
    "q": "What nerve is most commonly injured in axillary lymph node dissection?",
    "a": "<b>Long thoracic nerve</b> (serratus anterior paralysis → <b>winged scapula</b>)."
  },
  {
    "q": "What is the most common cause of <b>winged scapula</b>?",
    "a": "<b>Long thoracic nerve</b> injury."
  },
  {
    "q": "What muscles form the rotator cuff?",
    "a": "<ul><li><b>S</b>upraspinatus</li><li><b>I</b>nfraspinatus</li><li><b>T</b>eres minor</li><li><b>S</b>ubscapularis</li></ul><b>Mnemonic:</b> <b>SITS</b>"
  },
  {
    "q": "Which rotator cuff muscle is most commonly torn?",
    "a": "<b>Supraspinatus</b>."
  },
  {
    "q": "What is the function of the <b>supraspinatus</b>?",
    "a": "Initiates abduction of the arm (first 15–20°)."
  },
  {
    "q": "What nerve innervates the deltoid and <b>teres minor</b>?",
    "a": "<b>Axillary nerve</b> (C5–C6)."
  },
  {
    "q": "What is the most common nerve injured in anterior shoulder dislocation?",
    "a": "<b>Axillary nerve</b>."
  },
  {
    "q": "What is Erb's palsy (upper trunk brachial plexus injury)?",
    "a": "<b>C5–C6</b> injury → <b>Waiter's tip posture</b>:<ul><li>Arm adducted + internally rotated</li><li>Elbow extended</li><li>Wrist flexed</li></ul>"
  },
  {
    "q": "What is Klumpke's palsy (lower trunk brachial plexus injury)?",
    "a": "<b>C8–T1</b> injury:<ul><li><b>Claw hand</b></li><li><b>Horner syndrome</b> (if T1 sympathetic rami involved)</li></ul>"
  },
  {
    "q": "What is the blood supply to the upper limb?",
    "a": "<b>Subclavian</b> → <b>Axillary</b> → <b>Brachial</b> → <b>Radial</b> + <b>Ulnar</b> arteries."
  },
  {
    "q": "Where is the brachial artery pulse best palpated?",
    "a": "Medial to the biceps tendon in the antecubital fossa."
  },
  {
    "q": "What is the most common site for upper extremity arterial occlusion?",
    "a": "Subclavian artery (atherosclerosis)."
  },
  {
    "q": "What vein is most commonly used for central line placement in the upper limb?",
    "a": "Internal jugular or subclavian vein."
  },
  {
    "q": "What is the lymphatic drainage of the breast?",
    "a": "Primarily to axillary lymph nodes (especially pectoral group)."
  },
  {
    "q": "What is the order of axillary lymph node groups from lateral to medial?",
    "a": "Pectoral → subscapular → humeral → central → apical."
  },
  {
    "q": "What is the clinical significance of <b>Virchow's node</b>?",
    "a": "<b>Left supraclavicular node enlargement</b> — often indicates metastatic gastric cancer."
  },
  {
    "q": "What is the carpal tunnel?",
    "a": "Space bounded by carpal bones and flexor retinaculum containing <b>median nerve</b> and 9 flexor tendons."
  },
  {
    "q": "What is the most common entrapment neuropathy in the upper limb?",
    "a": "<b>Carpal tunnel syndrome</b> (<b>median nerve</b>)."
  },
  {
    "q": "What are the contents of the cubital fossa?",
    "a": "<ul><li>Tendon of <b>biceps</b></li><li><b>Brachial artery</b></li><li><b>Median nerve</b></li></ul><b>Mnemonic:</b> <b>TAN</b> (lateral to medial)"
  },
  {
    "q": "What is the anatomical snuffbox?",
    "a": "Bounded by extensor pollicis longus and brevis; contains radial artery and scaphoid bone."
  },
  {
    "q": "What bone is most commonly fractured in a fall on outstretched hand (FOOSH)?",
    "a": "Scaphoid (navicular)."
  },
  {
    "q": "What is the blood supply to the scaphoid?",
    "a": "<b>Retrograde from distal to proximal</b> — prone to avascular necrosis."
  },
  {
    "q": "What is <b>Colles' fracture</b>?",
    "a": "Distal radius fracture with dorsal angulation (<b>dinner fork deformity</b>)."
  },
  {
    "q": "What is <b>Smith's fracture</b>?",
    "a": "Distal radius fracture with volar angulation (reverse Colles')."
  },
  {
    "q": "What nerve is at risk in supracondylar humerus fracture?",
    "a": "<b>Median nerve</b> and brachial artery."
  },
  {
    "q": "What is the most common site of <b>radial nerve</b> injury?",
    "a": "Spiral groove of humerus (mid-shaft fracture)."
  },
  {
    "q": "What is the motor deficit in <b>radial nerve</b> injury?",
    "a": "<b>Wrist drop</b>, loss of finger extension."
  },
  {
    "q": "What is the sensory deficit in <b>radial nerve</b> injury?",
    "a": "Dorsal hand (first web space)."
  },
  {
    "q": "What is the <b>ulnar nerve</b> motor supply in the hand?",
    "a": "<ul><li><b>Hypothenar muscles</b></li><li><b>Interossei</b></li><li><b>Adductor pollicis</b></li><li><b>Medial two lumbricals</b></li></ul>"
  },
  {
    "q": "What is the most common site of <b>ulnar nerve</b> entrapment?",
    "a": "Cubital tunnel (at elbow)."
  },
  {
    "q": "What is the <b>claw hand</b> deformity caused by?",
    "a": "<b>Ulnar nerve</b> injury (hyperextension at MCP, flexion at IP joints of 4th and 5th digits)."
  },
  {
    "q": "What is the <b>median nerve</b> motor supply in the hand?",
    "a": "<b>Thenar muscles</b> — mnemonic <b>LOAF</b>:<ul><li><b>L</b>ateral two lumbricals</li><li><b>O</b>pponens pollicis</li><li><b>A</b>bductor pollicis brevis</li><li><b>F</b>lexor pollicis brevis</li></ul>"
  },
  {
    "q": "What is <b>ape hand</b> deformity?",
    "a": "<b>Median nerve injury</b> — loss of thumb opposition."
  },
  {
    "q": "What is the recurrent laryngeal nerve a branch of?",
    "a": "<b>Vagus nerve</b> (CN X)."
  },
  {
    "q": "What is the course of the left recurrent laryngeal nerve?",
    "a": "Loops under aortic arch."
  },
  {
    "q": "What is the course of the right recurrent laryngeal nerve?",
    "a": "Loops under right subclavian artery."
  },
  {
    "q": "What is the most common site of <b>femoral hernia</b>?",
    "a": "Femoral canal (medial to femoral vein, below inguinal ligament)."
  },
  {
    "q": "What is the boundary of <b>Hesselbach's triangle</b>?",
    "a": "<ul><li><b>Lateral:</b> inferior epigastric vessels</li><li><b>Medial:</b> rectus abdominis</li><li><b>Inferior:</b> inguinal ligament (site of direct inguinal hernia).</li></ul>"
  },
  {
    "q": "Differentiate direct vs <b>indirect inguinal hernia</b>.",
    "a": "<ul><li><b>Indirect:</b> through deep inguinal ring (lateral to inferior epigastric vessels), congenital.</li><li><b>Direct:</b> through Hesselbach's triangle (medial to inferior epigastric vessels), acquired.</li></ul>"
  },
  {
    "q": "What is the most common hernia in males?",
    "a": "<b>Indirect inguinal hernia</b>."
  },
  {
    "q": "What is the most common hernia in females?",
    "a": "<b>Femoral hernia</b>."
  },
  {
    "q": "What nerve is at risk during inguinal hernia repair?",
    "a": "<b>Ilioinguinal nerve</b>."
  },
  {
    "q": "What are the boundaries of the femoral triangle?",
    "a": "<ul><li><b>Superior:</b> inguinal ligament</li><li><b>Lateral:</b> sartorius</li><li><b>Medial:</b> adductor longus.</li></ul>"
  },
  {
    "q": "What are the contents of the femoral triangle (lateral to medial)?",
    "a": "<ul><li><b>N</b>erve (femoral)</li><li><b>A</b>rtery (femoral)</li><li><b>V</b>ein (femoral)</li><li><b>E</b>mpty space</li><li><b>L</b>ymphatics</li></ul><b>Mnemonic:</b> <b>NAVEL</b> (lateral to medial)"
  },
  {
    "q": "What is the adductor canal?",
    "a": "Passes from femoral triangle to popliteal fossa; contains femoral artery, vein, and <b>saphenous nerve</b>."
  },
  {
    "q": "What is the most common site of peripheral artery disease occlusion in the lower limb?",
    "a": "Superficial femoral artery (in adductor canal)."
  },
  {
    "q": "What is the largest branch of the femoral artery?",
    "a": "<b>Profunda femoris</b> (deep femoral artery)."
  },
  {
    "q": "What artery supplies the anterior compartment of the leg?",
    "a": "<b>Anterior tibial artery</b>."
  },
  {
    "q": "What artery supplies the posterior compartment of the leg?",
    "a": "<b>Posterior tibial artery</b>."
  },
  {
    "q": "What is the <b>dorsalis pedis</b> artery a continuation of?",
    "a": "<b>Anterior tibial artery</b>."
  },
  {
    "q": "What is the most common site for peripheral pulses in the lower limb?",
    "a": "<b>Dorsalis pedis</b> and posterior tibial."
  },
  {
    "q": "What is the innervation of the anterior compartment of the leg?",
    "a": "Deep peroneal (fibular) nerve."
  },
  {
    "q": "What is the innervation of the lateral compartment of the leg?",
    "a": "Superficial peroneal (fibular) nerve."
  },
  {
    "q": "What is the innervation of the posterior compartment of the leg?",
    "a": "<b>Tibial nerve</b>."
  },
  {
    "q": "What is <b>foot drop</b> caused by?",
    "a": "<b>Common peroneal nerve</b> injury (loss of dorsiflexion and eversion)."
  },
  {
    "q": "What is the most commonly injured nerve in knee trauma?",
    "a": "<b>Common peroneal nerve</b>."
  },
  {
    "q": "What is the sensory distribution of the <b>saphenous nerve</b>?",
    "a": "Medial leg and foot (branch of <b>femoral nerve</b>)."
  },
  {
    "q": "What is the sensory distribution of the <b>sural nerve</b>?",
    "a": "Lateral foot and little toe."
  },
  {
    "q": "What is the largest nerve in the body?",
    "a": "<b>Sciatic nerve</b> (L4–S3)."
  },
  {
    "q": "What muscles does the <b>sciatic nerve</b> innervate?",
    "a": "Hamstrings (biceps femoris, semitendinosus, semimembranosus) and <b>all</b> muscles below the knee."
  },
  {
    "q": "What is the most common site of <b>sciatic nerve</b> compression?",
    "a": "Piriformis muscle (<b>piriformis syndrome</b>)."
  },
  {
    "q": "What is <b>Trendelenburg sign</b>?",
    "a": "<b>Contralateral pelvic drop</b> when standing on one leg — due to <b>superior gluteal nerve</b> injury → <b>gluteus medius</b> weakness."
  },
  {
    "q": "What nerve innervates gluteus maximus?",
    "a": "Inferior gluteal nerve."
  },
  {
    "q": "What is the blood supply to the hip joint?",
    "a": "Medial and <b>lateral circumflex femoral</b> arteries (branches of <b>profunda femoris</b>) + obturator artery."
  },
  {
    "q": "What is the most common site of <b>avascular <b>necrosis</b></b> of the femoral head?",
    "a": "Intracapsular fracture of femoral neck."
  },
  {
    "q": "What is the order of structures in the popliteal fossa (lateral to medial)?",
    "a": "<ul><li><b>Common peroneal nerve</b> (most lateral)</li><li><b>Tibial nerve</b></li><li><b>Popliteal vein</b></li><li><b>Popliteal artery</b> (deepest)</li></ul>"
  },
  {
    "q": "What is the most common knee ligament injury?",
    "a": "Anterior cruciate ligament (<b>ACL</b>) tear."
  },
  {
    "q": "What is the unhappy triad of the knee?",
    "a": "<ul><li><b>ACL</b> tear</li><li><b>Medial meniscus</b> tear</li><li><b>MCL</b> tear</li></ul>"
  },
  {
    "q": "What is the most commonly injured meniscus?",
    "a": "Medial meniscus (more fixed)."
  },
  {
    "q": "What is the innervation of the knee joint?",
    "a": "Femoral, obturator, and sciatic nerves."
  },
  {
    "q": "What is the main blood supply to the anterior compartment of the thigh?",
    "a": "Femoral artery."
  },
  {
    "q": "What is the main blood supply to the posterior compartment of the thigh?",
    "a": "Perforating branches of <b>profunda femoris</b>."
  },
  {
    "q": "What is the innervation of the anterior compartment of the thigh?",
    "a": "<b>Femoral nerve</b>."
  },
  {
    "q": "What is the innervation of the medial compartment of the thigh?",
    "a": "<b>Obturator nerve</b>."
  },
  {
    "q": "What is the innervation of the posterior compartment of the thigh?",
    "a": "<b>Sciatic nerve</b> (tibial portion)."
  },
  {
    "q": "What are the boundaries of the inguinal canal?",
    "a": "<ul><li><b>Anterior:</b> external oblique aponeurosis</li><li><b>Posterior:</b> transversalis fascia</li><li><b>Roof:</b> internal oblique and transversus abdominis</li><li><b>Floor:</b> inguinal ligament</li></ul>"
  },
  {
    "q": "What passes through the superficial inguinal ring?",
    "a": "Spermatic cord (in males) or round ligament (in females) + <b>ilioinguinal nerve</b>."
  },
  {
    "q": "What is the conjoint tendon?",
    "a": "Fusion of internal oblique and transversus abdominis aponeuroses; reinforces posterior wall of inguinal canal."
  },
  {
    "q": "What is the lacunar ligament?",
    "a": "Extension of inguinal ligament to pectineal line; forms medial boundary of femoral ring."
  },
  {
    "q": "What is the pectineal ligament (Cooper's ligament)?",
    "a": "Strong fibrous band along superior pubic ramus; used in hernia repairs."
  },
  {
    "q": "What is the blood supply to the anterior abdominal wall?",
    "a": "Superior epigastric (from internal thoracic) and inferior epigastric (from external iliac) arteries."
  },
  {
    "q": "What is the nerve supply to the anterior abdominal wall?",
    "a": "T7–T12 intercostal nerves + L1 (iliohypogastric and ilioinguinal)."
  },
  {
    "q": "What is <b>McBurney's point</b>?",
    "a": "One-third the distance from anterior superior iliac spine to umbilicus (surface marking of appendix base)."
  },
  {
    "q": "What layers are incised in a McBurney (gridiron) incision for appendectomy?",
    "a": "<ol><li>External oblique</li><li>Internal oblique</li><li>Transversus abdominis</li><li>Transversalis fascia</li><li>Peritoneum</li></ol>"
  },
  {
    "q": "What is the blood supply of the appendix?",
    "a": "Appendicular artery (branch of ileocolic artery)."
  },
  {
    "q": "What is the venous drainage of the appendix?",
    "a": "Ileocolic vein → superior mesenteric vein → <b>portal vein</b>."
  },
  {
    "q": "What is the most common position of the appendix?",
    "a": "<b>Retrocecal</b>."
  },
  {
    "q": "What are the <b>taeniae coli</b>?",
    "a": "Three longitudinal bands of smooth muscle on the colon."
  },
  {
    "q": "What are <b>haustra</b>?",
    "a": "Sacculations of the colon caused by contraction of <b>taeniae coli</b>."
  },
  {
    "q": "What are epiploic appendages?",
    "a": "Fat-filled peritoneal tags on the surface of the colon."
  },
  {
    "q": "What is the blood supply of the foregut?",
    "a": "<b>Celiac trunk</b>."
  },
  {
    "q": "What is the blood supply of the midgut?",
    "a": "<b>Superior mesenteric artery</b> (SMA)."
  },
  {
    "q": "What is the blood supply of the hindgut?",
    "a": "<b>Inferior mesenteric artery</b> (IMA)."
  },
  {
    "q": "What is the watershed area between SMA and IMA?",
    "a": "<b>Splenic flexure (Griffith's point)</b> — prone to ischemia."
  },
  {
    "q": "What is the <b>marginal artery of Drummond</b>?",
    "a": "Anastomosis between SMA and IMA along the colon."
  },
  {
    "q": "What is the venous drainage of the gastrointestinal tract?",
    "a": "Portal venous system (to liver)."
  },
  {
    "q": "What is the portosystemic anastomosis at the esophagus?",
    "a": "<b>Left gastric vein</b> (portal) ↔ <b>esophageal veins</b> (azygos/systemic) → <b>esophageal varices</b> in portal HTN."
  },
  {
    "q": "What is the portosystemic anastomosis at the umbilicus?",
    "a": "<b>Paraumbilical veins</b> (portal) ↔ <b>superficial epigastric veins</b> (systemic) → <b>caput medusae</b>."
  },
  {
    "q": "What is the portosystemic anastomosis at the rectum?",
    "a": "<b>Superior rectal vein</b> (portal) ↔ <b>middle & inferior rectal veins</b> (systemic) → <b>anorectal varices</b>."
  },
  {
    "q": "What is the most common cause of <b>portal hypertension</b>?",
    "a": "<b>Cirrhosis</b>."
  },
  {
    "q": "What are the boundaries of the lesser sac (<b>omental bursa</b>)?",
    "a": "<ul><li><b>Anterior:</b> lesser omentum and stomach</li><li><b>Posterior:</b> pancreas, left kidney, aorta</li><li><b>Superior:</b> caudate lobe of liver</li></ul>"
  },
  {
    "q": "What is the <b>epiploic foramen</b> (of Winslow)?",
    "a": "Communication between greater and lesser sacs; anterior boundary is hepatoduodenal ligament (portal triad)."
  },
  {
    "q": "What is <b>Pringle's maneuver</b>?",
    "a": "Clamping the hepatoduodenal ligament to control hepatic bleeding."
  },
  {
    "q": "What are the peritoneal reflections in the pelvis (female)?",
    "a": "<b>Rectouterine pouch (pouch of Douglas)</b> — most dependent part."
  },
  {
    "q": "What is the most common site of peritoneal fluid collection in females?",
    "a": "<b>Rectouterine pouch</b> (<b>pouch of Douglas</b>)."
  },
  {
    "q": "What is the blood supply of the rectum?",
    "a": "Superior rectal (IMA), middle rectal (<b>internal iliac</b>), inferior rectal (internal pudendal)."
  },
  {
    "q": "What is the lymphatic drainage above the <b>pectinate line</b>?",
    "a": "<b>Internal iliac</b> nodes (portal drainage)."
  },
  {
    "q": "What is the lymphatic drainage below the <b>pectinate line</b>?",
    "a": "Superficial inguinal nodes (systemic drainage)."
  },
  {
    "q": "What is the dentate (pectinate) line?",
    "a": "Junction between endoderm (above) and ectoderm (below) in the anal canal."
  },
  {
    "q": "What is the clinical significance of the <b>dentate line</b>?",
    "a": "Different blood supply, innervation, lymphatic drainage, and type of hemorrhoids (internal vs external)."
  },
  {
    "q": "What is the blood supply to the liver?",
    "a": "<b>Hepatic artery</b> (25%, oxygenated) + <b>Portal vein</b> (75%, nutrient-rich)."
  },
  {
    "q": "What is the venous drainage of the liver?",
    "a": "Hepatic veins → inferior vena cava."
  },
  {
    "q": "What are the functional lobes of the liver?",
    "a": "Divided by <b>Cantlie's line</b> (from IVC to gallbladder fossa) into right and left functional lobes."
  },
  {
    "q": "What is the bare area of the liver?",
    "a": "Area on the diaphragmatic surface not covered by peritoneum (between coronary ligaments)."
  },
  {
    "q": "What is <b>Calot's triangle</b>?",
    "a": "Bounded by cystic duct, common hepatic duct, and inferior surface of liver. Contains cystic artery."
  },
  {
    "q": "What is the most common variation in hepatic arterial supply?",
    "a": "Replaced right <b>hepatic artery</b> from <b>superior mesenteric artery</b>."
  },
  {
    "q": "What is the <b>porta hepatis</b>?",
    "a": "Hilum of the liver; contains <b>portal vein</b>, <b>hepatic artery</b>, and common hepatic duct."
  },
  {
    "q": "What is the <b>ligamentum teres hepatis</b>?",
    "a": "Remnant of left umbilical vein."
  },
  {
    "q": "What is the <b>ligamentum venosum</b>?",
    "a": "Remnant of ductus venosus."
  },
  {
    "q": "What is the blood supply to the gallbladder?",
    "a": "Cystic artery (usually from right <b>hepatic artery</b>)."
  },
  {
    "q": "What is the venous drainage of the gallbladder?",
    "a": "Cystic vein → <b>portal vein</b>."
  },
  {
    "q": "What is the innervation of the gallbladder?",
    "a": "Parasympathetic via vagus; sympathetic via celiac plexus."
  },
  {
    "q": "What is the most common site of gallstone impaction?",
    "a": "<b>Hartmann's pouch</b> or cystic duct."
  },
  {
    "q": "What is the <b>triangle of Calot</b> clinically important for?",
    "a": "Safe dissection during cholecystectomy to avoid bile duct injury."
  },
  {
    "q": "What is the blood supply to the pancreas?",
    "a": "<ul><li><b>Head:</b> Superior + inferior pancreaticoduodenal arteries</li><li><b>Body & tail:</b> Splenic artery branches</li></ul>"
  },
  {
    "q": "What is the venous drainage of the pancreas?",
    "a": "Primarily into <b>portal vein</b> and <b>splenic vein</b>."
  },
  {
    "q": "What is the relationship of the pancreas to the <b>splenic vein</b>?",
    "a": "<b>Splenic vein</b> runs posterior to the body and tail of the pancreas."
  },
  {
    "q": "What is the most common site of pancreatic cancer?",
    "a": "Head of pancreas."
  },
  {
    "q": "What is <b>Courvoisier's sign</b>?",
    "a": "Painless jaundice + palpable gallbladder = suggestive of pancreatic head cancer."
  },
  {
    "q": "What is the embryonic origin of the spleen?",
    "a": "Mesoderm (dorsal mesogastrium)."
  },
  {
    "q": "What is the blood supply to the spleen?",
    "a": "<b>Splenic artery</b> (branch of <b>celiac trunk</b>)."
  },
  {
    "q": "What is the venous drainage of the spleen?",
    "a": "<b>Splenic vein</b> → <b>portal vein</b>."
  },
  {
    "q": "What ligaments attach the spleen?",
    "a": "<b>Gastrosplenic ligament</b> and <b>splenorenal ligament</b>."
  },
  {
    "q": "What is the most common cause of splenic rupture?",
    "a": "Blunt abdominal trauma (especially left lower ribs)."
  },
  {
    "q": "What is <b>Kehr's sign</b>?",
    "a": "Left shoulder pain due to diaphragmatic irritation from splenic rupture."
  },
  {
    "q": "What is the blood supply to the duodenum?",
    "a": "Superior pancreaticoduodenal (from gastroduodenal) and inferior pancreaticoduodenal (from SMA)."
  },
  {
    "q": "What is the most common site of duodenal ulcer?",
    "a": "First part of duodenum (duodenal bulb)."
  },
  {
    "q": "What is the blood supply to the jejunum and ileum?",
    "a": "<b>Superior mesenteric artery</b> via jejunal and ileal branches."
  },
  {
    "q": "What is the blood supply to the ascending colon and proximal 2/3 transverse colon?",
    "a": "<b>Superior mesenteric artery</b>."
  },
  {
    "q": "What is the blood supply to the distal 1/3 transverse colon, descending colon, and sigmoid?",
    "a": "<b>Inferior mesenteric artery</b>."
  },
  {
    "q": "What is the most common site of colonic ischemia?",
    "a": "<b>Splenic flexure</b> (watershed area)."
  },
  {
    "q": "What is the lymphatic drainage of the colon?",
    "a": "Follows arterial supply to SMA and IMA nodes → cisterna chyli."
  },
  {
    "q": "What is the venous drainage above the <b>dentate line</b>?",
    "a": "Superior rectal vein → inferior mesenteric vein → portal system."
  },
  {
    "q": "What is the venous drainage below the <b>dentate line</b>?",
    "a": "Middle and inferior rectal veins → <b>internal iliac</b> veins → systemic circulation."
  },
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
    "q": "What is the most common site of ureteric constriction?",
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
    "q": "What are the zones of the prostate?",
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
    "q": "What is the innervation of the penis (erection vs ejaculation)?",
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
    "q": "What is the clinical consequence of <b>anterior spinal artery</b> occlusion?",
    "a": "<b>Anterior Spinal Artery Syndrome:</b><ul><li>Bilateral <b>loss of motor function</b> (corticospinal tract)</li><li>Bilateral <b>loss of pain and temperature</b> (spinothalamic tract)</li><li><b>Preserved proprioception and vibration</b> (dorsal columns)</li></ul>"
  },
  {
    "q": "What is the venous drainage of the spinal cord?",
    "a": "Anterior and posterior spinal veins → vertebral venous plexus (<b>Batson's plexus</b>)."
  },
  {
    "q": "What is the clinical significance of <b>Batson's plexus</b>?",
    "a": "Valveless communication between pelvic veins and vertebral veins → route for prostate/breast cancer <b>metastasis</b> to spine."
  },
  {
    "q": "What are the boundaries of the posterior triangle of the neck?",
    "a": "<ul><li><b>Anterior:</b> sternocleidomastoid</li><li><b>Posterior:</b> trapezius</li><li><b>Inferior:</b> clavicle.</li></ul>"
  },
  {
    "q": "What structures are in the posterior triangle of the neck?",
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
    "q": "What are the three major openings in the diaphragm and their levels?",
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
    "q": "What are the layers traversed during lumbar puncture?",
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
module.exports = { anatomyCards };
