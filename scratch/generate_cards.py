import json
import re

cards = [
    # --- FHR MONITORING (NICHD Guidelines) ---
    {
        "q": "What is the normal baseline range for the fetal heart rate (FHR)?",
        "a": "<b>110 to 160 beats per minute (bpm)</b>."
    },
    {
        "q": "How is fetal bradycardia defined under NICHD guidelines?",
        "a": "A baseline fetal heart rate of <b>< 110 bpm</b> for a duration of <b>10 minutes or longer</b>."
    },
    {
        "q": "What are the common maternal causes of fetal bradycardia?",
        "a": "Maternal hypotension (e.g., post-epidural), connective tissue disease (causing congenital heart block), hypothermia, and drug administration (e.g., beta-blockers)."
    },
    {
        "q": "What are the common fetal causes of fetal bradycardia?",
        "a": "Fetal acidosis, umbilical cord prolapse/compression, congenital heart block, and late-stage fetal hypoxia."
    },
    {
        "q": "How is fetal tachycardia defined under NICHD guidelines?",
        "a": "A baseline fetal heart rate of <b>> 160 bpm</b> for a duration of <b>10 minutes or longer</b>."
    },
    {
        "q": "What maternal conditions commonly lead to fetal tachycardia?",
        "a": "Maternal fever/chorioamnionitis (most common), hyperthyroidism, dehydration, and drug use (e.g., terbutaline, cocaine, amphetamines)."
    },
    {
        "q": "What fetal conditions commonly cause fetal tachycardia?",
        "a": "Acute fetal hypoxia (early phase), fetal tachyarrhythmias (e.g., supraventricular tachycardia), fetal anemia, and fetal infection."
    },
    {
        "q": "How is baseline FHR variability defined?",
        "a": "Fluctuations in the baseline FHR that are <b>irregular in amplitude and frequency</b>, visually determined from peak to trough."
    },
    {
        "q": "What defines absent FHR variability?",
        "a": "An amplitude range that is visually <b>undetectable</b> (0 bpm)."
    },
    {
        "q": "What defines minimal FHR variability?",
        "a": "An amplitude range that is visually detectable but <b>$\\\\le 5$ bpm</b>."
    },
    {
        "q": "What defines moderate FHR variability, and what does it indicate?",
        "a": "An amplitude range of <b>6 to 25 bpm</b>; it indicates a normal, well-oxygenated fetal autonomic nervous system."
    },
    {
        "q": "What defines marked FHR variability?",
        "a": "An amplitude range of <b>> 25 bpm</b>."
    },
    {
        "q": "What are the primary causes of minimal or absent FHR variability?",
        "a": "Fetal sleep cycles (usually lasting 20-40 minutes), maternal medication (e.g., opioids, magnesium sulfate), fetal hypoxia, and acidosis."
    },
    {
        "q": "What is the NICHD definition of a fetal heart rate acceleration at $\\\\ge 32$ weeks gestation?",
        "a": "A visually apparent abrupt increase in FHR of <b>$\\\\ge 15$ bpm</b> above the baseline, with a duration from onset to return of <b>$\\\\ge 15$ seconds</b> (but < 2 minutes)."
    },
    {
        "q": "What is the NICHD definition of a fetal heart rate acceleration at < 32 weeks gestation?",
        "a": "A visually apparent abrupt increase in FHR of <b>$\\\\ge 10$ bpm</b> above the baseline, with a duration from onset to return of <b>$\\\\ge 10$ seconds</b> (but < 2 minutes)."
    },
    {
        "q": "What is a prolonged acceleration?",
        "a": "An acceleration that lasts <b>between 2 and 10 minutes</b>; an acceleration lasting $\\\\ge 10$ minutes is defined as a baseline change."
    },
    {
        "q": "What does the presence of FHR accelerations indicate?",
        "a": "Fetal movement and a non-acidotic fetus (reassuring finding)."
    },
    {
        "q": "What is the definition of a FHR deceleration?",
        "a": "A temporary decrease in the FHR below the baseline, classified as early, late, variable, or prolonged based on shape and timing."
    },
    {
        "q": "What is the definition of an early deceleration?",
        "a": "A visually apparent, gradual decrease (onset to nadir <b>$\\\\ge 30$ seconds</b>) and return of FHR associated with a contraction, where the nadir mirrors the peak of the contraction."
    },
    {
        "q": "What is the pathophysiology behind early decelerations?",
        "a": "<b>Fetal head compression</b> leading to vagal nerve stimulation, which transiently slows the heart rate."
    },
    {
        "q": "What is the appropriate clinical management for early decelerations?",
        "a": "No active intervention is required, as they are physiological and not associated with fetal hypoxia."
    },
    {
        "q": "What is the definition of a late deceleration?",
        "a": "A visually apparent, gradual decrease (onset to nadir <b>$\\\\ge 30$ seconds</b>) and return of FHR associated with a contraction, where the nadir occurs <b>after the peak</b> of the contraction."
    },
    {
        "q": "What is the pathophysiology behind late decelerations?",
        "a": "<b>Uteroplacental insufficiency</b> leading to transient fetal hypoxemia during uterine contractions."
    },
    {
        "q": "What are the common maternal causes of late decelerations?",
        "a": "Maternal hypotension (often from epidural anesthesia), uterine tachysystole (hyperstimulation), and chronic uteroplacental vascular disease (e.g., preeclampsia, chronic hypertension)."
    },
    {
        "q": "What is the definition of a variable deceleration?",
        "a": "A visually apparent, abrupt decrease (onset to nadir <b>< 30 seconds</b>) in FHR of <b>$\\\\ge 15$ bpm</b>, lasting <b>$\\\\ge 15$ seconds</b> but < 2 minutes."
    },
    {
        "q": "What is the pathophysiology behind variable decelerations?",
        "a": "<b>Umbilical cord compression</b>, which causes transient occlusion of umbilical vessels."
    },
    {
        "q": "What are the accelerative phases before and after a variable deceleration called, and what do they represent?",
        "a": "<b>Shoulders</b>; they represent a compensatory sympathetic response to transient occlusion of the umbilical vein before and after complete cord occlusion."
    },
    {
        "q": "What features of variable decelerations are considered atypical or concerning?",
        "a": "Slow return to baseline, loss of moderate variability within the deceleration, and a prolonged 'shoulder' with a subsequent drop."
    },
    {
        "q": "What is the first-line intervention for recurrent variable decelerations?",
        "a": "<b>Maternal position change</b> (e.g., left or right lateral decubitus) to relieve umbilical cord compression."
    },
    {
        "q": "What medical procedure can be performed to treat persistent variable decelerations caused by oligohydramnios?",
        "a": "<b>Amnioinfusion</b> (instillation of normal saline or lactated Ringer's into the uterine cavity via an IUPC)."
    },
    {
        "q": "What defines a prolonged deceleration?",
        "a": "A visually apparent decrease in FHR below the baseline of <b>$\\\\ge 15$ bpm</b> lasting <b>$\\\\ge 2$ minutes</b> but <b>< 10 minutes</b>."
    },
    {
        "q": "What are the most common causes of a prolonged deceleration?",
        "a": "Umbilical cord prolapse, maternal hypotension (e.g., post-epidural), uterine rupture, placental abruption, or rapid fetal descent."
    },
    {
        "q": "What defines a baseline FHR change rather than a deceleration or acceleration?",
        "a": "A change in FHR baseline lasting <b>$\\\\ge 10$ minutes</b>."
    },
    {
        "q": "How is a sinusoidal FHR pattern described visually?",
        "a": "A smooth, sine wave-like undulating pattern in FHR baseline with a cycle frequency of <b>3 to 5 cycles per minute</b> that persists for <b>$\\\\ge 20$ minutes</b>."
    },
    {
        "q": "What does a true sinusoidal FHR pattern indicate clinically?",
        "a": "Severe <b>fetal anemia</b> or severe acute fetal hypoxia."
    },
    {
        "q": "What are the most common causes of a sinusoidal FHR pattern?",
        "a": "Rh isoimmunization, severe feto-maternal hemorrhage, twin-to-twin transfusion syndrome, or ruptured vasa previa."
    },
    {
        "q": "What causes a pseudo-sinusoidal FHR pattern, and how is it distinguished?",
        "a": "Maternal administration of <b>opioids</b> (e.g., butorphanol, fentanyl, meperidine); it is typically transient (lasting < 30-40 minutes) and has a less regular waveform."
    },
    {
        "q": "What are the specific criteria required for a Category I FHR tracing?",
        "a": "Baseline 110-160 bpm, <b>moderate variability</b>, no late/variable decelerations, early decelerations present or absent, accelerations present or absent."
    },
    {
        "q": "What is the clinical interpretation and management of a Category I FHR tracing?",
        "a": "It is normal, strongly predictive of normal fetal acid-base status, and requires <b>routine management</b> (no specific intervention)."
    },
    {
        "q": "What are the specific criteria for a Category III FHR tracing?",
        "a": "Absent baseline FHR variability AND any of the following: <b>recurrent late decelerations</b>, <b>recurrent variable decelerations</b>, or <b>bradycardia</b>; OR a <b>sinusoidal pattern</b>."
    },
    {
        "q": "What does a Category III FHR tracing indicate, and what is the management?",
        "a": "It indicates abnormal fetal acid-base status; it requires <b>immediate preparation for delivery</b> and simultaneous <b>intrauterine resuscitation</b>."
    },
    {
        "q": "How is a Category II FHR tracing defined?",
        "a": "It is <b>indeterminate</b>; it includes all FHR tracings that do not meet the criteria for Category I or Category III."
    },
    {
        "q": "What is the management algorithm for a Category II FHR tracing?",
        "a": "Continued evaluation, close monitoring, and initiating <b>intrauterine resuscitation maneuvers</b> if there are signs of potential fetal decompensation."
    },
    {
        "q": "How is uterine tachysystole defined?",
        "a": "<b>> 5 contractions in 10 minutes</b>, averaged over a 30-minute window."
    },
    {
        "q": "Why is uterine tachysystole dangerous to the fetus?",
        "a": "It prevents adequate uterine relaxation, leading to progressive reduction in uteroplacental blood flow and fetal hypoxia."
    },
    {
        "q": "What is the mechanism of left lateral maternal positioning in intrauterine resuscitation?",
        "a": "It relieves <b>aortocaval compression</b> by the gravid uterus, increasing maternal venous return, cardiac output, and uteroplacental perfusion."
    },
    {
        "q": "How does an IV fluid bolus aid in intrauterine resuscitation?",
        "a": "It expands maternal intravascular volume, correcting hypotension (especially post-epidural) and increasing uterine blood flow."
    },
    {
        "q": "Why is oxytocin discontinued during intrauterine resuscitation?",
        "a": "To decrease contraction frequency and duration, thereby increasing uteroplacental perfusion and allowing the fetus to recover from hypoxic stress."
    },
    {
        "q": "Which tocolytic agent is commonly administered to treat uterine tachysystole, and what is its dose/route?",
        "a": "<b>Terbutaline</b>, 0.25 mg subcutaneously."
    },
    {
        "q": "What maternal medications are used to treat hypotension during labor to improve FHR patterns?",
        "a": "Vasopressors such as <b>ephedrine</b> or <b>phenylephrine</b>."
    },
    {
        "q": "What is the purpose of performing fetal scalp stimulation?",
        "a": "To assess fetal acid-base status; a resulting acceleration of FHR rules out significant fetal metabolic acidosis (<b>$\\\\text{pH} \\\\ge 7.20$</b>)."
    },
    {
        "q": "What fetal scalp blood pH and lactate levels indicate significant acidosis requiring delivery?",
        "a": "<b>$\\\\text{pH} < 7.20$</b> or <b>$\\\\text{lactate} > 4.8\\\\text{ mmol/L}$</b>."
    },
    {
        "q": "What is the clinical status of fetal pulse oximetry in intrapartum management?",
        "a": "It is <b>not recommended</b> for clinical use, as randomized trials show it does not reduce cesarean rates or improve outcomes."
    },
    {
        "q": "What are the prerequisites for placing a fetal scalp electrode (FSE)?",
        "a": "Ruptured membranes, adequate cervical dilation (typically <b>$\\\\ge 2$ cm</b>), and an accessible, engaged fetal presenting part."
    },
    {
        "q": "What are the absolute contraindications to placing a fetal scalp electrode?",
        "a": "Maternal infection with <b>HIV</b>, <b>active genital Herpes Simplex Virus (HSV)</b>, or <b>Hepatitis B/C</b>, and suspected fetal bleeding disorders."
    },
    {
        "q": "What parameters are measured by an intrauterine pressure catheter (IUPC)?",
        "a": "The frequency, duration, baseline tone, and peak pressure of uterine contractions in millimeters of mercury (mmHg)."
    },
    {
        "q": "What is the formula for calculating Montevideo Units (MVUs) using an IUPC tracing?",
        "a": "$$\\\\text{Montevideo Units} = \\\\sum (\\\\text{Peak pressure of each contraction in mmHg} - \\\\text{Baseline uterine tone in mmHg}) \\\\text{ over a } 10\\\\text{-minute window}$$"
    },
    {
        "q": "What MVU threshold defines adequate uterine contractions in active labor?",
        "a": "<b>$\\\\ge 200$ MVUs</b>."
    },
    {
        "q": "What are the potential complications associated with IUPC placement?",
        "a": "Placental abruption, uterine perforation, umbilical cord vessel laceration, and increased risk of intra-amniotic infection."
    },
    {
        "q": "To determine the baseline FHR, what is the minimum required duration of interpretable tracing?",
        "a": "At least <b>2 minutes</b> of interpretable baseline data in any 10-minute segment."
    },
    {
        "q": "What is the definition of recurrent decelerations?",
        "a": "Decelerations that occur with <b>$\\\\ge 50\\\\%$</b> of uterine contractions in any 20-minute window."
    },
    {
        "q": "What is the definition of intermittent decelerations?",
        "a": "Decelerations that occur with <b>$< 50\\\\%$</b> of uterine contractions in any 20-minute window."
    },
    {
        "q": "What clinical scenario mandates umbilical cord blood gas analysis?",
        "a": "Apgar score <b>$\\\\le 5$</b> at 5 minutes, assisted operative delivery, Category III FHR tracing, intrapartum fever, or severe growth restriction."
    },
    {
        "q": "Which cord vessel (artery or vein) is more reflective of fetal tissue metabolism and acid-base status?",
        "a": "The <b>umbilical artery</b> (carrying blood from the fetus to the placenta)."
    },
    {
        "q": "What is the normal pH of umbilical artery blood at delivery?",
        "a": "Approximately 7.20 to 7.30; a <b>$\\\\text{pH} < 7.00$</b> indicates pathological acidemia."
    },
    {
        "q": "What is the baseline FHR variability classification when the amplitude range is 1-5 bpm?",
        "a": "<b>Minimal variability</b>."
    },

    # --- OBSTETRIC EMERGENCIES: SHOULDER DYSTOCIA ---
    {
        "q": "What is the definition of shoulder dystocia?",
        "a": "A delivery requiring additional obstetric maneuvers to release the fetal shoulders after gentle downward traction on the fetal head has failed."
    },
    {
        "q": "What are the primary antepartum risk factors for shoulder dystocia?",
        "a": "Fetal macrosomia (birth weight > 4000g or > 4500g), maternal diabetes (pregestational or gestational), obesity, and prior history of shoulder dystocia."
    },
    {
        "q": "What are the primary intrapartum risk factors for shoulder dystocia?",
        "a": "Prolonged second stage of labor, oxytocin induction/augmentation, and operative vaginal delivery (forceps or vacuum)."
    },
    {
        "q": "What is the 'turtle sign' in labor?",
        "a": "The retraction of the delivered fetal head against the maternal perineum, signifying impaction of the anterior shoulder behind the pubic symphysis."
    },
    {
        "q": "What is the first step in the management of shoulder dystocia?",
        "a": "<b>Call for additional assistance</b> (anesthesiology, pediatrics, extra nursing staff) and instruct the mother to <b>stop pushing</b>."
    },
    {
        "q": "Describe the McRoberts maneuver.",
        "a": "Hyperflexion of the maternal hips against the abdomen, which flattens the sacrum and rotates the pubic symphysis cephalad, facilitating shoulder release."
    },
    {
        "q": "How does suprapubic pressure assist in resolving shoulder dystocia?",
        "a": "Pressure is applied to the maternal abdomen over the anterior shoulder, directing it downward and laterally to adduct and displace it from behind the pubic symphysis."
    },
    {
        "q": "Why is fundal pressure contraindicated in shoulder dystocia?",
        "a": "It worsens the impaction of the anterior shoulder against the pubic symphysis and increases the risk of uterine rupture and brachial plexus injury."
    },
    {
        "q": "Describe the Rubin II maneuver.",
        "a": "Insertion of two fingers into the vagina behind the posterior aspect of the anterior shoulder to apply pressure, adducting the shoulder and reducing its width."
    },
    {
        "q": "Describe the Wood's screw maneuver.",
        "a": "Applying pressure to the anterior aspect of the posterior shoulder to rotate it <b>$180^\\\\circ$</b>, turning the posterior shoulder into the anterior position."
    },
    {
        "q": "What is the 'reverse Wood's screw' (Rubin I) maneuver?",
        "a": "Applying pressure to the posterior aspect of the posterior shoulder to rotate the fetus in the opposite direction."
    },
    {
        "q": "How is the delivery of the posterior arm performed?",
        "a": "The clinician's hand is inserted into the vagina, the posterior forearm is swept across the fetal chest, and the hand is delivered, reducing the shoulder diameter."
    },
    {
        "q": "What is the Gaskin maneuver?",
        "a": "Placing the mother on her <b>hands and knees</b> (all-fours position), which increases pelvic dimensions and utilizes gravity to release the shoulder."
    },
    {
        "q": "What is the Zavanelli maneuver, and when is it indicated?",
        "a": "Cephalic replacement (flexing and pushing the fetal head back into the vagina) followed by emergency cesarean delivery; it is a last-resort maneuver."
    },
    {
        "q": "What is a cleidotomy, and when is it performed?",
        "a": "The surgical division of the fetal clavicle (using scissors) to reduce the biacromial diameter, typically reserved for cases of fetal demise."
    },
    {
        "q": "What is a symphysiotomy?",
        "a": "The surgical division of the cartilage of the maternal pubic symphysis under local anesthesia to increase pelvic capacity in extreme cases."
    },
    {
        "q": "What is the most common neonatal nerve injury associated with shoulder dystocia?",
        "a": "<b>Erb's palsy</b> (injury to the <b>$C_5\\\\text{-}C_6$</b> nerve roots of the brachial plexus), resulting in a 'waiter's tip' arm posture."
    },
    {
        "q": "What is Klumpke's palsy, and what nerve roots are affected?",
        "a": "Injury to the <b>$C_8\\\\text{-}T_1$</b> nerve roots, causing a 'claw hand' deformity and loss of sensation in the hand/forearm."
    },

    # --- OBSTETRIC EMERGENCIES: UMBILICAL CORD PROLAPSE ---
    {
        "q": "What is the difference between overt and occult umbilical cord prolapse?",
        "a": "<b>Overt prolapse</b> is the descent of the cord past the presenting part into the vagina or vulva; <b>occult prolapse</b> is when the cord lies adjacent to the presenting part."
    },
    {
        "q": "What are the key risk factors for umbilical cord prolapse?",
        "a": "Fetal malpresentation (especially transverse lie or footling breech), polyhydramnios, prematurity, unengaged presenting part, and low birth weight."
    },
    {
        "q": "What iatrogenic intervention is a major risk factor for umbilical cord prolapse?",
        "a": "<b>Artificial rupture of membranes (AROM)</b> performed when the fetal presenting part is high and unengaged."
    },
    {
        "q": "How is umbilical cord prolapse diagnosed?",
        "a": "Palpation of a soft, pulsating loop of cord in the vaginal canal during a pelvic exam, often accompanied by sudden, severe variable decelerations or bradycardia."
    },
    {
        "q": "What is the immediate first step upon diagnosing overt umbilical cord prolapse?",
        "a": "Manually <b>elevate the fetal presenting part</b> off the cord by placing a hand in the vagina, and keep it there until delivery."
    },
    {
        "q": "What maternal positions are used to reduce pressure on the prolapsed umbilical cord?",
        "a": "<b>Knee-chest position</b> or <b>Trendelenburg position</b>."
    },
    {
        "q": "How can bladder instillation assist in cord prolapse management?",
        "a": "Instilling 500 to 700 mL of saline into the maternal bladder via a Foley catheter lifts the fetal presenting part off the prolapsed cord."
    },
    {
        "q": "Why should you avoid manually pushing a prolapsed cord back into the uterus?",
        "a": "It can cause <b>vasospasm</b> of the umbilical vessels, worsening fetal hypoxemia, and is associated with poorer outcomes."
    },
    {
        "q": "What is the definitive treatment for umbilical cord prolapse during active labor?",
        "a": "<b>Emergency cesarean delivery</b> (unless vaginal delivery is imminent)."
    },

    # --- OBSTETRIC EMERGENCIES: UTERINE RUPTURE ---
    {
        "q": "What is the difference between a complete uterine rupture and a uterine dehiscence?",
        "a": "A <b>complete rupture</b> involves all layers of the uterus (endometrium, myometrium, and serosa) with communication into the peritoneal cavity; <b>dehiscence</b> is an incomplete separation with intact serosa."
    },
    {
        "q": "What is the most significant risk factor for uterine rupture?",
        "a": "A prior <b>cesarean delivery</b> or other transmural uterine surgery (e.g., myomectomy entering the endometrial cavity)."
    },
    {
        "q": "What type of prior cesarean incision carries the highest risk of uterine rupture during a trial of labor after cesarean (TOLAC)?",
        "a": "A prior <b>classical cesarean incision</b> (vertical incision in the active upper segment), carrying a <b>$4\\\\text{-}9\\\\%$</b> risk."
    },
    {
        "q": "Which uterotonic/induction agents are contraindicated in patients undergoing TOLAC due to increased rupture risk?",
        "a": "Prostaglandins (e.g., <b>misoprostol</b>, dinoprostone) are contraindicated; oxytocin must be used with extreme caution."
    },
    {
        "q": "What is the most common presenting sign of uterine rupture?",
        "a": "An <b>abnormal fetal heart rate tracing</b>, most commonly prolonged decelerations, deep variable decelerations, or bradycardia."
    },
    {
        "q": "What classic physical exam signs suggest uterine rupture?",
        "a": "Sudden loss of fetal station (fetal head recedes), palpable fetal parts through the maternal abdominal wall, and cessation of contractions."
    },
    {
        "q": "What maternal symptoms are classic for uterine rupture?",
        "a": "Sudden, tearing abdominal pain, vaginal bleeding, and referred shoulder/chest pain (due to hemoperitoneum irritating the diaphragm)."
    },
    {
        "q": "What is the immediate management for uterine rupture?",
        "a": "Immediate <b>emergency laparotomy</b>, delivery of the fetus, and uterine repair or hysterectomy."
    },

    # --- OBSTETRIC EMERGENCIES: AMNIOTIC FLUID EMBOLISM (AFE) ---
    {
        "q": "What is amniotic fluid embolism (AFE)?",
        "a": "A rare, life-threatening obstetric emergency where amniotic fluid, fetal cells, or debris enter the maternal circulation, triggering a severe immune/inflammatory response."
    },
    {
        "q": "When does amniotic fluid embolism typically occur?",
        "a": "During labor, delivery, or within 30 minutes of postpartum."
    },
    {
        "q": "What is the classic clinical triad of amniotic fluid embolism?",
        "a": "1. <b>Hypoxia</b> (sudden dyspnea, cyanosis, ARDS)<br>2. <b>Hypotension</b> (cardiogenic shock)<br>3. <b>Coagulopathy</b> (DIC)"
    },
    {
        "q": "Describe the two phases of cardiovascular collapse in AFE.",
        "a": "An initial phase of acute pulmonary hypertension and right ventricular failure, followed by a secondary phase of left ventricular failure and pulmonary edema."
    },
    {
        "q": "What is the hallmark coagulopathy finding in AFE?",
        "a": "Severe <b>Disseminated Intravascular Coagulopathy (DIC)</b>, characterized by rapid depletion of fibrinogen and profuse hemorrhage."
    },
    {
        "q": "What is the primary management strategy for AFE?",
        "a": "<b>Supportive care</b>: high-fraction oxygen/intubation, fluid resuscitation, vasopressors, inotropes, and massive transfusion protocol."
    },
    {
        "q": "What does the 'AOK' protocol for AFE consist of?",
        "a": "<b>Atropine</b> (0.8 mg), <b>Ondansetron</b> (8 mg), and <b>Ketorolac</b> (30 mg) IV, aimed at blocking the vagal and anaphylactoid-like reactions."
    },

    # --- OBSTETRIC EMERGENCIES: POSTPARTUM HEMORRHAGE (PPH) ---
    {
        "q": "What is the definition of postpartum hemorrhage (PPH)?",
        "a": "Cumulative blood loss <b>$\\\\ge 1000$ mL</b> or blood loss accompanied by signs or symptoms of hypovolemia within 24 hours after birth."
    },
    {
        "q": "What is the most common cause of postpartum hemorrhage?",
        "a": "<b>Uterine atony</b> (failure of the uterus to contract and compress spiral arteries), accounting for <b>$70\\\\text{-}80\\\\%$</b> of cases."
    },
    {
        "q": "What are the '4 T's' of postpartum hemorrhage?",
        "a": "1. <b>Tone</b> (uterine atony)<br>2. <b>Tissue</b> (retained placenta/clots)<br>3. <b>Trauma</b> (lacerations/inversion/rupture)<br>4. <b>Thrombin</b> (coagulopathy)"
    },
    {
        "q": "What are the main risk factors for uterine atony?",
        "a": "Uterine overdistension (polyhydramnios, multiples, macrosomia), prolonged labor, chorioamnionitis, and high parity."
    },
    {
        "q": "What is the first-line medication for uterine atony, and what is its major side effect if given as a rapid IV bolus?",
        "a": "<b>Oxytocin</b>; rapid IV bolus can cause severe <b>hypotension</b> and water intoxication/hyponatremia."
    },
    {
        "q": "What is the mechanism of Methylergonovine (Methergine), and what is its primary contraindication?",
        "a": "An ergot alkaloid that causes smooth muscle contraction; contraindicated in <b>hypertension</b> and <b>preeclampsia</b>."
    },
    {
        "q": "What is Carboprost tromethamine (Hemabate), and what is its primary contraindication?",
        "a": "A prostaglandin <b>$F_{2\\\\alpha}$</b> analog; contraindicated in patients with <b>asthma</b> (causes severe bronchospasm)."
    },
    {
        "q": "What is the dosing and common routes of administration for Misoprostol (Cytotec) in PPH?",
        "a": "<b>800 to 1000 mcg</b> administered rectally, buccally, or sublingually."
    },
    {
        "q": "What are the common side effects of misoprostol?",
        "a": "Transient <b>pyrexia</b> (fever) and <b>shivering/rigors</b>."
    },
    {
        "q": "What is the role of Tranexamic Acid (TXA) in PPH management?",
        "a": "An antifibrinolytic that reduces bleeding-related mortality when administered within <b>3 hours</b> of delivery."
    },
    {
        "q": "What defines retained placenta, and what is the management?",
        "a": "Failure to deliver the placenta within 30 minutes of birth; managed by manual extraction or curettage under anesthesia."
    },
    {
        "q": "Define placenta accreta, increta, and percreta.",
        "a": "<b>Accreta</b>: villi attach directly to myometrium;<br><b>Increta</b>: villi invade myometrium;<br><b>Percreta</b>: villi penetrate through myometrium and serosa (often into bladder)."
    },
    {
        "q": "What is the primary risk factor for placenta accreta spectrum?",
        "a": "Prior cesarean delivery combined with <b>placenta previa</b>."
    },
    {
        "q": "What is a uterine inversion?",
        "a": "A rare emergency where the uterine fundus collapses into the uterine cavity, turning inside out, often due to excessive cord traction on an unseparated placenta."
    },
    {
        "q": "What is the immediate management for uterine inversion?",
        "a": "<b>Manual replacement</b> of the uterine fundus (Johnson maneuver) before removing the placenta and before administering uterotonic agents."
    },
    {
        "q": "What pharmacologic agents can be used to relax the uterus during uterine inversion replacement?",
        "a": "Nitroglycerin, terbutaline, or halogenated inhalational anesthetics."
    },
    {
        "q": "What is the purpose of an intrauterine balloon tamponade (e.g., Bakri balloon)?",
        "a": "To exert hydrostatic pressure from within the uterine cavity to compress bleeding sinuses in uterine atony; it is filled with up to 500 mL of sterile fluid."
    },
    {
        "q": "What is a B-Lynch suture?",
        "a": "A surgical compression suture used during laparotomy that wraps around the uterus like suspenders to physically compress the anterior and posterior walls."
    },
    {
        "q": "What is the surgical target for uterine artery ligation (O'Leary stitch)?",
        "a": "Ligation of the uterine artery and its branches near the junction of the cervix and lower uterine segment."
    },
    {
        "q": "What is the mechanism and risk of internal iliac (hypogastric) artery ligation?",
        "a": "It reduces pelvic arterial pulse pressure; the main risk is accidental ligation of the <b>external iliac artery</b>, which compromises lower limb perfusion."
    },
    {
        "q": "What is the definitive surgical management for postpartum hemorrhage when conservative medical and surgical therapies fail?",
        "a": "<b>Emergency peripartum hysterectomy</b>."
    },

    # --- ADVANCED/SPECIFIC CLINICAL PEARLS & DETAILS ---
    {
        "q": "Which tocolytic drug class can mask fetal tachycardia by decreasing the fetal heart rate baseline?",
        "a": "<b>Beta-blockers</b> (e.g., labetalol, propranolol) administered to the mother can cause fetal bradycardia or mask tachycardia."
    },
    {
        "q": "How does maternal hyperthyroidism lead to fetal tachycardia?",
        "a": "Transplacental passage of thyroid-stimulating immunoglobulins (TSIs) or maternal thyroid hormones stimulates the fetal cardiac system."
    },
    {
        "q": "Which FHR decel type is characterized by a rapid decrease to nadir in < 30 seconds and a duration of 15 seconds to 2 minutes?",
        "a": "<b>Variable deceleration</b>."
    },
    {
        "q": "Which FHR decel type is characterized by a gradual decrease to nadir in $\\\\ge 30$ seconds and a nadir that occurs after the peak of the contraction?",
        "a": "<b>Late deceleration</b>."
    },
    {
        "q": "Which FHR decel type is characterized by a gradual decrease to nadir in $\\\\ge 30$ seconds and a nadir that coincides with the peak of the contraction?",
        "a": "<b>Early deceleration</b>."
    },
    {
        "q": "What is the physiologic cause of the 'shoulders' surrounding a variable deceleration?",
        "a": "Compression of the low-pressure <b>umbilical vein</b> causes transient decreased venous return and compensatory tachycardia; subsequent release causes the second shoulder."
    },
    {
        "q": "What is the clinical significance of a lack of accelerations on a 40-minute non-stress test (NST)?",
        "a": "It is a <b>non-reactive NST</b>, most commonly due to a benign fetal sleep cycle, but requires further assessment (e.g., biophysical profile)."
    },
    {
        "q": "How is a reactive NST defined at $\\\\ge 32$ weeks?",
        "a": "At least <b>two FHR accelerations</b> ($\\ge 15$ bpm lasting $\\ge 15$ seconds) within a 20-minute window."
    },
    {
        "q": "Under NICHD guidelines, does Category II FHR tracing require immediate delivery?",
        "a": "No, it requires <b>continued surveillance and re-evaluation</b>, along with intrauterine resuscitation if indicated."
    },
    {
        "q": "What is the physiological basis of using terbutaline for FHR Category II/III tracings associated with tachysystole?",
        "a": "It is a beta-2 adrenergic agonist that relaxes uterine smooth muscle, stopping contractions and restoring uteroplacental blood flow."
    },
    {
        "q": "What are the three components of the 'intrauterine resuscitation' bundle for late decelerations?",
        "a": "Maternal lateral positioning, intravenous fluid bolus, and discontinuation of uterine stimulants (oxytocin)."
    },
    {
        "q": "What is the primary maternal risk associated with the Zavanelli maneuver?",
        "a": "Severe maternal soft tissue trauma, uterine rupture, and significant postpartum hemorrhage."
    },
    {
        "q": "Which neonatal nerve injury presents with a 'claw hand' and Horner's syndrome?",
        "a": "<b>Klumpke's palsy</b> (due to injury to $C_8\\text{-}T_1$ roots, which carry sympathetic fibers to the eye)."
    },
    {
        "q": "Why is the knee-chest position effective in managing umbilical cord prolapse?",
        "a": "It uses gravity to shift the fetus cephalad, relieving pressure off the umbilical cord at the pelvic inlet."
    },
    {
        "q": "What is the main risk of performing an artificial rupture of membranes (AROM) when the fetal station is -3?",
        "a": "<b>Umbilical cord prolapse</b>, as the high presenting part allows cord slip-through when fluid gushes."
    },
    {
        "q": "What is the classic FHR abnormality seen in acute uterine rupture?",
        "a": "<b>Sudden prolonged deceleration</b> or baseline bradycardia."
    },
    {
        "q": "What is the primary risk of using high-dose oxytocin during a trial of labor after cesarean (TOLAC)?",
        "a": "Uterine hyperstimulation leading to <b>uterine rupture</b>."
    },
    {
        "q": "What is the pathophysiologic mechanism of coagulopathy in amniotic fluid embolism?",
        "a": "Amniotic fluid tissue factor activates the extrinsic clotting cascade, causing massive intravascular coagulation and fibrin consumption."
    },
    {
        "q": "What is the primary cause of maternal death in the first 2 hours after amniotic fluid embolism?",
        "a": "<b>Profound cardiogenic shock</b> and acute right ventricular failure."
    },
    {
        "q": "What is the most effective initial treatment for uterine atony after placental delivery?",
        "a": "<b>Bimanual uterine massage</b> combined with immediate administration of <b>oxytocin</b>."
    },
    {
        "q": "Which uterotonic agent is contraindicated in patients with a history of asthma?",
        "a": "<b>Carboprost tromethamine (Hemabate)</b>."
    },
    {
        "q": "Which uterotonic agent is contraindicated in patients with gestational hypertension or preeclampsia?",
        "a": "<b>Methylergonovine (Methergine)</b>."
    },
    {
        "q": "What is the maximum volume of saline typically used to inflate a Bakri balloon to tamponade postpartum hemorrhage?",
        "a": "<b>500 mL</b>."
    },
    {
        "q": "What surgical compression suture is placed horizontally/vertically without entering the uterine cavity to manage atonic PPH?",
        "a": "The <b>B-Lynch suture</b>."
    },
    {
        "q": "Ligation of which artery is performed as a fertility-sparing method to manage pelvic hemorrhage, and what is its alternative name?",
        "a": "<b>Internal iliac artery</b> (also known as the <b>hypogastric artery</b>)."
    ]

# Verify the number of cards
print(f"Total cards defined: {len(cards)}")

# Output the JavaScript file
target_path = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\cards_fetal_mon_emerg.js"

with open(target_path, "w", encoding="utf-8") as f:
    f.write("const CARDS_FETAL_MON_EMERG = [\n")
    for card in cards:
        # We need to output each card as a valid JS object on one line
        # Double escape backslashes for JS strings.
        # Python json.dumps will handle normal escaping, but we must make sure LaTeX backslashes are double-escaped in the output JS file.
        q_str = json.dumps(card["q"], ensure_ascii=False)
        a_str = json.dumps(card["a"], ensure_ascii=False)
        
        # In json.dumps, a backslash becomes \\.
        # But we need double-escaped backslashes in the output JS code, which means it should write \\\\ in the raw text.
        # Let's inspect the string representation:
        # If card["a"] contains "$\\\\le 5$", in python it is stored as "$\\\\le 5$".
        # json.dumps("$\\\\le 5$") will produce '"$\\\\\\\\le 5$"' (8 backslashes in raw text representing 4 backslashes).
        # When JS parses it, it turns 4 backslashes into 2. That's exactly what we want!
        # Let's verify by replacing and checking.
        
        f.write(f"  {{ q: {q_str}, a: {a_str} }},\n")
    f.write("];\n")

print("File generated successfully.")
