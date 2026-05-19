import json
import random

topic_slug = 'optho-cataract'

templates = [
    # ─── TEMPLATE 1: NUCLEAR SCLEROTIC CATARACT & MYOPIC SHIFT ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-year history of slowly progressive, painless blurring of distance vision in both eyes. The patient notes significant difficulty seeing highway signs while driving and complains of a bothersome glare and halo effect around headlights at night. However, the patient reports a surprising recent improvement in near vision, stating that {pronoun} is now able to read the newspaper without reading glasses for the first time in years. Ophthalmic examination reveals:<br>• Best-corrected visual acuity: <b>20/50 in the right eye, 20/60 in the left eye</b><br>• Slit-lamp biomicroscopy: <b>Diffuse yellowing, nuclear condensation, and moderate brunescence of the crystalline lens bilaterally</b><br>• Fundus examination: <b>Normal macula, optic disc, and peripheral retina in both eyes</b><br><br>What is the most likely diagnosis, and what is the physiological explanation for the patient's improved near vision?",
        "options": [
            "Nuclear sclerotic cataract; myopic shift due to an increase in the refractive index of the lens nucleus",
            "Cortical cataract; hyperopic shift due to swelling of the lens cortex",
            "Posterior subcapsular cataract; accommodation spasm from chronic pupillary miosis",
            "Age-related macular degeneration; eccentric fixation yielding pseudopresbyopia correction",
            "Nuclear sclerotic cataract; presbyopic reversal caused by selective atrophy of the ciliary body"
        ],
        "answer": 0,
        "exp": "This clinical vignette describes a classic **nuclear sclerotic cataract**, the most common type of age-related cataract. Nuclear cataracts are characterized by a slow, progressive hardening (sclerosis) and yellow-to-brown discoloration (brunescence) of the central lens nucleus. The increase in nuclear density increases the **refractive index** of the lens, which causes a progressive **myopic shift** (nearsightedness). In presbyopic patients who previously required reading glasses, this myopic shift temporarily offsets their presbyopia, allowing them to read at near without correction again—a phenomenon historically termed **'second sight'**. However, distance vision continues to deteriorate, and patients complain of glare and haloes at night due to light scattering."
    },

    # ─── TEMPLATE 2: POSTERIOR SUBCAPSULAR CATARACT SECONDARY TO CORTICOSTEROIDS ───
    {
        "q": "A {age}-old {gender} with a history of severe rheumatoid arthritis managed with daily oral prednisone for the past {years} years presents with a rapid, progressive decline in vision in the {eye_side} eye over the past {duration} months. The patient notes that vision is significantly worse in bright sunlight and when attempting to read small print. Ophthalmic examination findings include:<br>• Best-corrected distance visual acuity: <b>{va_distance}</b><br>• Near visual acuity: <b>Jaeger 8 (J8)</b> (normal J1)<br>• Slit-lamp examination: <b>A granular, plaque-like opacity localized to the posterior cortex and subcapsular region of the lens, directly in the visual axis</b><br>• Intraocular pressure: <b>{iop} mmHg</b> (normal 10-21 mmHg)<br><br>What is the most likely diagnosis, and which of the following represents the most established pharmacological risk factor?",
        "options": [
            "Posterior subcapsular cataract (PSC); chronic corticosteroid therapy",
            "Nuclear sclerotic cataract; chronic use of nonsteroidal anti-inflammatory drugs (NSAIDs)",
            "Cortical cataract; long-term hydroxychloroquine therapy",
            "Posterior subcapsular cataract (PSC); systemic methotrexate therapy",
            "Anterior subcapsular cataract; chronic topical beta-blocker administration"
        ],
        "answer": 0,
        "exp": "The clinical presentation of rapid-onset vision loss, particularly worse in bright light (due to pupillary miosis which restricts light rays to the central posterior subcapsular opacity) and worse at near (reading), along with slit-lamp findings of a plaque-like opacity in the posterior subcapsular lens cortex, is pathognomonic for a **posterior subcapsular cataract (PSC)**. Chronic **corticosteroid therapy** (either systemic, topical, inhaled, or intravitreal) is a highly established risk factor for PSC. Corticosteroids alter the lens epithelial cells' migration and protein synthesis, leading to aberrant cells accumulating at the posterior pole. PSC can also occur secondary to diabetes, intraocular inflammation (chronic uveitis), or radiation."
    },

    # ─── TEMPLATE 3: INTRAOPERATIVE FLOPPY IRIS SYNDROME (IFIS) SECONDARY TO TAMSULOSIN ───
    {
        "q": "A {age}-old {gender} is undergoing routine phacoemulsification for a mature age-related cataract. Immediately after the corneal incisions are created and the anterior chamber is entered, the surgeon notes that the iris is remarkably flaccid, billows in response to normal irrigation currents, and repeatedly prolapses through the side-port incisions. Furthermore, despite aggressive preoperative dilation, the pupil undergoes progressive, stubborn constriction. The patient's medication list is reviewed. Which of the following drugs is the most likely cause of this intraoperative complication, and what is the underlying mechanism?",
        "options": [
            "Tamsulosin; blockade of alpha-1a adrenergic receptors in the iris dilator muscle causing loss of tone and permanent atrophy",
            "Finasteride; inhibition of 5-alpha reductase leading to androgenic atrophy of the ciliary muscle",
            "Amiodarone; deposition of microcrystals within the iris stroma impairing mechanical pupillary dilation",
            "Latanoprost; chronic upregulation of prostaglandin receptors causing hyperpigmentation and rigidity of the iris sphincter",
            "Metformin; metabolic dysfunction of the pupillary dilator muscle due to localized glycogen depletion"
        ],
        "answer": 0,
        "exp": "This patient is experiencing **Intraoperative Floppy Iris Syndrome (IFIS)**, which is a well-documented complication of cataract surgery characterized by a triad of: (1) a flaccid, billowing iris stroma, (2) a propensity for the iris to prolapse through surgical incisions, and (3) progressive intraoperative pupillary miosis. IFIS is strongly associated with the use of **tamsulosin** (or other selective alpha-1a adrenergic antagonists) commonly prescribed for **benign prostatic hyperplasia (BPH)**. Alpha-1a blockers inhibit the receptors on the iris dilator muscle, leading to a loss of muscle tone and eventual atrophy. Crucially, the risk of IFIS persists **indefinitely**, even if tamsulosin is discontinued weeks or months prior to surgery; thus, preoperative cessation is not recommended. Surgeons must prepare with intraoperative strategies such as iris hooks, Malyugin rings, or highly cohesive viscoelastics."
    },

    # ─── TEMPLATE 4: ACUTE POST-CATARACT ENDOPHTHALMITIS ───
    {
        "q": "A {age}-old {gender} presents with sudden, excruciating pain, redness, and a dramatic drop in vision in the {eye_side} eye that began {days} days after undergoing uncomplicated phacoemulsification with intraocular lens implantation. Clinical findings include:<br>• Visual acuity: <b>{va_bad}</b> (baseline 20/25 postoperative day 1)<br>• Slit-lamp biomicroscopy: <b>Eyelid edema, severe conjunctival injection, chemosis, dense corneal edema, and a {hypopyon_size}-mm layer of purulent debris in the inferior anterior chamber (hypopyon)</b><br>• Funduscopy: <b>Completely obscured red reflex with a dense vitreal yellow-green haze</b><br><br>What is the most likely diagnosis, and what is the immediate, gold-standard management?",
        "options": [
            "Acute postoperative endophthalmitis; emergent vitreous tap for cultures and intravitreal injection of broad-spectrum antibiotics (Vancomycin and Ceftazidime)",
            "Steroid-induced uveitis; immediate discontinuation of postoperative prednisolone drops and initiation of oral corticosteroids",
            "Toxic Anterior Segment Syndrome (TASS); immediate hourly topical prednisolone acetate and intensive cycloplegics",
            "Acute angle-closure glaucoma; emergent Nd:YAG laser peripheral iridotomy",
            "Posterior capsular rupture with vitreous loss; urgent pars plana vitrectomy with secondary scleral-fixated IOL"
        ],
        "answer": 0,
        "exp": "The clinical presentation of acute, severe pain, marked vision loss, conjunctival injection, **hypopyon** (pus in the anterior chamber), and a **loss of the red reflex** (due to vitreous clouding) within 1 week of cataract surgery is highly characteristic of **acute postoperative endophthalmitis**. This is a devastating, sight-threatening medical emergency. The most common causative organism is *Staphylococcus epidermidis* (coagulase-negative staphylococcus) followed by *Staphylococcus aureus* and Gram-negative rods. Immediate management is mandatory and consists of a **vitreous tap** (to obtain fluid for Gram stain and culture) followed immediately by **intravitreal injection of broad-spectrum empiric antibiotics** (typically **Vancomycin** for Gram-positives and **Ceftazidime** or Amikacin for Gram-negatives). If the patient's visual acuity is Light Perception (LP) or worse, the Endophthalmitis Vitrectomy Study (EVS) guidelines recommend immediate **pars plana vitrectomy (PPV)**."
    },

    # ─── TEMPLATE 5: TOXIC ANTERIOR SEGMENT SYNDROME (TASS) VS. ENDOPHTHALMITIS ───
    {
        "q": "A {age}-old {gender} presents with mild eye redness and painless blurry vision in the {eye_side} eye {hours} hours after undergoing uncomplicated cataract surgery. Ophthalmic examination reveals:<br>• Visual acuity: <b>20/80</b><br>• Slit-lamp examination: <b>Diffuse, limbus-to-limbus corneal edema, severe anterior chamber cell and flare, and a small hypopyon</b><br>• Posterior segment: <b>Perfectly clear vitreous gel, bright red reflex, no vitritis</b><br>• Intraocular pressure: <b>{iop} mmHg</b><br><br>What is the most likely diagnosis, and what is the pathophysiology and treatment of this condition?",
        "options": [
            "Toxic Anterior Segment Syndrome (TASS); sterile inflammatory reaction to intraoperative contaminants, treated with intensive topical corticosteroids",
            "Acute infectious endophthalmitis; bacterial colonization of the anterior chamber, treated with intravitreal vancomycin",
            "Phacolytic glaucoma; leakage of lens proteins through an intact capsule, treated with emergent cataract extraction",
            "Irvine-Gass syndrome; inflammatory cystoid macular edema, treated with topical NSAIDs",
            "Posterior capsular opacification; epithelial cell proliferation, treated with Nd:YAG laser capsulotomy"
        ],
        "answer": 0,
        "exp": "**Toxic Anterior Segment Syndrome (TASS)** is an acute, sterile, non-infectious anterior segment inflammatory reaction that classically occurs within **12 to 24 hours** after intraocular surgery. It is caused by chemical or toxic contaminants on surgical instruments, cannulas, viscoelastics, or intraocular solutions. Clinical hallmarks include **diffuse, limbus-to-limbus corneal edema** (due to widespread corneal endothelial toxicity) and severe anterior chamber inflammation (cell/flare, sometimes hypopyon), but **crucially, there is no vitritis/vitreal involvement**, and the vitreous remains perfectly clear with a bright red reflex. TASS is typically **painless** or causes only mild discomfort. Unlike infectious endophthalmitis (which occurs later, is severely painful, and involves the vitreous), TASS is treated aggressively with **intensive topical corticosteroids** (e.g., prednisolone acetate every 1 hour), which results in rapid resolution of the inflammation."
    },

    # ─── TEMPLATE 6: POSTERIOR CAPSULAR OPACIFICATION (PCO) & Nd:YAG LASER CAPSULOTOMY ───
    {
        "q": "A {age}-old {gender} reports a gradual, painless, progressive decline in visual acuity and worsening glare while driving at night in the {eye_side} eye over the past {duration} months. The patient underwent highly successful phacoemulsification with posterior chamber intraocular lens (PCIOL) implantation in that same eye {years} years ago. Clinical examination findings:<br>• Visual acuity: <b>{va_bad} (was 20/20 at 1-month post-op)</b><br>• Slit-lamp examination: <b>PCIOL is centered and stable in the capsular bag; the posterior capsule is thickened with a granular, 'wrinkled' appearance and multiple tiny, translucent vesicular lesions (Elschnig pearls)</b><br>• Dilated funduscopy: <b>Clear vitreous; normal optic nerve and macula</b><br><br>What is the most likely diagnosis, and what is the standard, non-invasive outpatient treatment of choice?",
        "options": [
            "Posterior capsular opacification (PCO); Nd:YAG laser capsulotomy",
            "Posterior capsular opacification (PCO); surgical explantation and exchange of the intraocular lens",
            "Intraocular lens subluxation; surgical scleral fixation of the PCIOL",
            "Cystoid macular edema (Irvine-Gass syndrome); intravitreal anti-VEGF injection",
            "Dry age-related macular degeneration; outpatient argon laser photocoagulation"
        ],
        "answer": 0,
        "exp": "**Posterior capsular opacification (PCO)** is the most common late complication of successful cataract surgery, historically referred to as a 'secondary cataract'. It is caused by the proliferation, migration, and transdifferentiation of residual **lens epithelial cells** (from the equator of the capsular bag) across the posterior capsule. Slit-lamp findings classically demonstrate a wrinkled, opacified posterior capsule or clusters of vesicular structures known as **Elschnig pearls**. The standard, highly effective, non-invasive treatment is an outpatient **Nd:YAG laser capsulotomy**, which uses a photodisruptive laser to create a small central opening in the posterior capsule, restoring a clear visual axis and immediately improving visual acuity."
    },

    # ─── TEMPLATE 7: IRVINE-GASS SYNDROME (CYSTOID MACULAR EDEMA) ───
    {
        "q": "A {age}-old {gender} complains of progressive, painless blurring of central vision in the {eye_side} eye that began {weeks} weeks after undergoing uncomplicated cataract surgery. The patient reports that straight lines appear slightly wavy (metamorphopsia). Clinical examination findings:<br>• Visual acuity: <b>{va_bad} (was 20/20 at 1-week postoperative visit)</b><br>• Slit-lamp examination: <b>Anterior segment is quiet; PCIOL is stable in the capsular bag; posterior capsule is clear</b><br>• Dilated funduscopy: <b>Loss of the normal foveal reflex with a subtle, thickened, cystic appearance of the macula</b><br>• Optical coherence tomography (OCT): <b>Marked retinal thickening with intraretinal cystic fluid spaces in a flower-petal pattern</b><br><br>What is the most likely diagnosis, and what is the standard first-line management?",
        "options": [
            "Cystoid macular edema (Irvine-Gass syndrome); topical NSAID drops (e.g., ketorolac) combined with topical corticosteroid drops (e.g., prednisolone)",
            "Wet age-related macular degeneration; emergent photodynamic therapy with verteporfin",
            "Acute postoperative endophthalmitis; emergent vitreous tap and intravitreal vancomycin",
            "Posterior capsular opacification (PCO); Nd:YAG laser capsulotomy",
            "Central retinal vein occlusion (CRVO); immediate panretinal photocoagulation (PRP)"
        ],
        "answer": 0,
        "exp": "**Cystoid Macular Edema (CME)** occurring after cataract surgery is known as **Irvine-Gass syndrome**. It typically peaks around **4 to 10 weeks** postoperatively. The pathophysiology involves surgical manipulation triggering the release of inflammatory mediators (prostaglandins) that diffuse posteriorly, causing a breakdown of the blood-retinal barrier and subsequent fluid accumulation in the Henle outer plexiform layer of the macula. OCT is highly diagnostic, classically demonstrating **intraretinal cystic spaces** arranged in a petaloid or flower-petal pattern. The standard first-line treatment is medical, combining **topical NSAIDs** (to block prostaglandin synthesis) with **topical corticosteroids** (to suppress the inflammatory pathway), which achieves resolution in the vast majority of cases."
    },

    # ─── TEMPLATE 8: CLASSIC GALACTOSEMIA WITH OIL-DROPLET CATARACTS ───
    {
        "q": "A {age_weeks}-week-old infant is brought to the pediatrician due to persistent vomiting, poor feeding, and failure to thrive since birth. On physical examination, the infant is found to be lethargic, jaundiced, and has prominent hepatosplenomegaly. Urinalysis reveals the presence of reducing substances, but glucose oxidase test is negative. Red blood cell enzyme assay confirms a severe deficiency of galactose-1-phosphate uridylyltransferase (GALT). Ophthalmic screening with a red reflex exam reveals bilateral, central lens opacities with an 'oil-droplet' appearance. What is the diagnosis, what substance is accumulating within the lens to cause cataracts, and what is the primary management?",
        "options": [
            "Classic galactosemia; accumulation of galactitol in the lens; immediate dietary elimination of lactose and galactose",
            "Galactokinase deficiency; accumulation of galactose-1-phosphate in the lens; oral administration of lactase enzyme",
            "Congenital rubella syndrome; systemic viral replication in the lens epithelium; immediate surgical lens extraction",
            "Alport syndrome; defective type IV collagen synthesis in the lens capsule; close monitoring and annual screening",
            "Classic galactosemia; accumulation of sorbitol in the lens; immediate dietary supplementation with glucose"
        ],
        "answer": 0,
        "exp": "This infant presents with **classic galactosemia**, an autosomal recessive disorder caused by a deficiency in **galactose-1-phosphate uridylyltransferase (GALT)**. The accumulation of galactose-1-phosphate leads to multi-system toxicity (hepatomegaly, jaundice, vomiting, renal tubulopathy, and Escherichia coli sepsis). In the lens of the eye, excess galactose is converted by the enzyme **aldose reductase** into **galactitol**, a sugar alcohol. Galactitol cannot diffuse out of the lens, creating an osmotic gradient that draws water in, leading to swelling, rupture of lens fibers, and the development of characteristic **'oil-droplet' cataracts**. The primary management is the **immediate and lifelong dietary elimination of lactose and galactose** (milk/dairy products). If initiated early, the cataracts and liver damage can regress."
    },

    # ─── TEMPLATE 9: MYOTONIC DYSTROPHY WITH CHRISTMAS-TREE CATARACTS ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-year history of progressive, painless blurring of vision in both eyes. The patient also complains of generalized muscle weakness and notes that {pronoun} has difficulty releasing {possessive} grip after shaking hands or holding a doorknob. Physical examination reveals bilateral ptosis, expressionless facial features ('myopathic facies'), temporalis muscle wasting, and frontal balding. Slit-lamp examination of both lenses demonstrates multiple polychromatic, highly iridescent red, green, and gold needle-like crystals in the deep cortex and subcapsular regions, reminiscent of a 'christmas tree'. What is the most likely diagnosis, and what is the underlying genetic mutation?",
        "options": [
            "Myotonic dystrophy type 1 (DM1); CTG trinucleotide repeat expansion in the DMPK gene",
            "Marfan syndrome; autosomal dominant missense mutation in the FBN1 gene",
            "Wilson's disease; autosomal recessive mutation in the ATP7B copper-transporting gene",
            "Homocystinuria; cystathionine beta-synthase deficiency with cystine depletion",
            "Fabry disease; X-linked recessive alpha-galactosidase A deficiency"
        ],
        "answer": 0,
        "exp": "The clinical combination of progressive cataracts, myotonia (inability to relax muscles after voluntary contraction, e.g., releasing grip), distal muscle weakness, ptosis, and frontal balding is diagnostic of **myotonic dystrophy type 1 (DM1)**. The pathognomonic cataract finding in myotonic dystrophy is the **'christmas-tree' cataract**, characterized by beautiful, polychromatic, iridescent needle-like crystals (composed of cholesterol and lipids) scattered throughout the lens cortex. DM1 is an autosomal dominant disorder caused by a **CTG trinucleotide repeat expansion** in the 3' untranslated region of the **DMPK** (dystrophia myotonica protein kinase) gene on chromosome 19. It exhibits genetic anticipation."
    },

    # ─── TEMPLATE 10: ECTOPIA LENTIS - MARFAN VS HOMOCYSTINURIA ───
    {
        "q": "A {age}-old {gender} is referred for an ophthalmic examination. Physical examination is notable for tall stature, exceptionally long and slender fingers (arachnodactyly), high-arched palate, and mild pectus excavatum. The patient's father died suddenly of a ruptured thoracic aortic dissection at age 38. Slit-lamp examination after pupillary dilation reveals that the crystalline lens in both eyes is displaced superotemporally (upward and outward), with several stretched, intact ciliary zonules visible. What is the most likely diagnosis, and what is the inheritance pattern and genetic defect?",
        "options": [
            "Marfan syndrome; autosomal dominant defect in the FBN1 gene encoding Fibrillin-1",
            "Homocystinuria; autosomal recessive deficiency of cystathionine beta-synthase",
            "Marfan syndrome; autosomal recessive defect in the COL3A1 gene encoding Type III Collagen",
            "Weill-Marchesani syndrome; autosomal dominant defect in the ADAMTS10 gene causing downward subluxation",
            "Ehlers-Danlos syndrome (vascular type); autosomal dominant defect in vascular collagen deposition"
        ],
        "answer": 0,
        "exp": "This patient displays the classic features of **Marfan syndrome**, an autosomal dominant connective tissue disorder caused by mutations in the **FBN1 gene** on chromosome 15, which encodes the glycoprotein **fibrillin-1** (a major component of extracellular microfibrils). Fibrillin-1 is a crucial structural component of the **ciliary zonules** that suspend the lens. The classic ectopia lentis (lens displacement/subluxation) in Marfan syndrome is **superotemporal (upward and outward)**, and the zonules typically remain intact though stretched. This contrasts with **homocystinuria**, an autosomal recessive metabolic disorder (cystathionine beta-synthase deficiency) where lens displacement is classically **inferonasal (downward and inward)**, and the ciliary zonules are completely broken/disrupted, often accompanied by intellectual disability and thromboembolic events."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her"},
    {"gender": "male", "pronoun": "he", "possessive": "his"},
    {"gender": "woman", "pronoun": "she", "possessive": "her"},
    {"gender": "man", "pronoun": "he", "possessive": "his"},
    {"gender": "lady", "pronoun": "she", "possessive": "her"},
    {"gender": "gentleman", "pronoun": "he", "possessive": "his"}
]

mcqs = []
counter = 0

# Target: 350 MCQs
while counter < 350:
    for t in templates:
        if counter >= 350:
            break
            
        age = random.randint(48, 88)
        gp = random.choice(genders_pool)
        
        # Clinical parameters
        duration = random.randint(2, 6)
        years = random.randint(3, 15)
        eye_side = random.choice(["right", "left"])
        
        va_distance = random.choice(["20/60", "20/70", "20/80", "20/100", "20/150"])
        iop = random.randint(11, 23)
        days = random.randint(2, 7)
        hours = random.randint(12, 36)
        hypopyon_size = round(random.uniform(0.5, 2.5), 1)
        weeks = random.randint(4, 10)
        
        age_weeks = random.randint(3, 12)
        
        va_bad = random.choice(["20/200", "20/300", "20/400", "Count fingers (CF) at 3 feet", "Hand motion (HM) only", "Light perception (LP) only"])
        
        # Formatting values
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'],
            duration=duration, years=years, eye_side=eye_side, va_distance=va_distance,
            iop=iop, days=days, hours=hours, hypopyon_size=hypopyon_size, weeks=weeks,
            age_weeks=age_weeks, va_bad=va_bad
        )
        
        # Shuffling options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Escape characters
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_optho_cataract_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Ophthalmology: Cataract & lens disorders\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-cataract' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic optho-cataract not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    -- Clear existing MCQs for this topic to avoid duplicates\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
