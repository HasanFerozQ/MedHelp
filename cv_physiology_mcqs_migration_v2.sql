-- Cardiovascular Physiology MCQ Migration (FULL 100 QUESTIONS)
-- This script clears existing MCQs for this topic to avoid duplication.

DO $$
BEGIN
    -- 1. Migration: Ensure columns exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='mcqs' AND column_name='difficulty') THEN
        ALTER TABLE public.mcqs ADD COLUMN difficulty TEXT DEFAULT 'Medium';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='mcqs' AND column_name='order') THEN
        ALTER TABLE public.mcqs ADD COLUMN "order" INTEGER DEFAULT 0;
    END IF;
END $$;

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    -- 2. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Cardiovascular Physiology' AND semester_id = 2 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (semester_id, title, slug, "order")
        VALUES (2, 'Cardiovascular Physiology', 'cardiovascular-physiology', 1)
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. Clear existing MCQs for this topic
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;

    -- 4. Bulk Insert 100 Questions
    INSERT INTO public.mcqs (topic_id, question, options, correct_index, difficulty, "order")
    VALUES 
    (v_topic_id, 'Mean arterial pressure is best approximated by:', '["Cardiac output ÷ total peripheral resistance", "Cardiac output × total peripheral resistance", "Heart rate × stroke volume", "Systolic pressure − diastolic pressure", "Venous return × compliance"]', 1, 'Easy', 1),
    (v_topic_id, 'Cardiac output is equal to:', '["Heart rate × end-diastolic volume", "Heart rate × stroke volume", "Stroke volume ÷ heart rate", "Mean arterial pressure × total peripheral resistance", "End-systolic volume × heart rate"]', 1, 'Easy', 2),
    (v_topic_id, 'Stroke volume is:', '["End-systolic volume − end-diastolic volume", "End-diastolic volume − end-systolic volume", "Cardiac output − heart rate", "Ejection fraction × heart rate", "Pulse pressure ÷ heart rate"]', 1, 'Easy', 3),
    (v_topic_id, 'Ejection fraction is defined as:', '["Stroke volume ÷ end-systolic volume", "End-diastolic volume ÷ stroke volume", "Stroke volume ÷ end-diastolic volume", "Cardiac output ÷ stroke volume", "Heart rate ÷ stroke volume"]', 2, 'Easy', 4),
    (v_topic_id, 'Preload is best approximated by:', '["Mean arterial pressure", "End-diastolic ventricular volume", "Total peripheral resistance", "Pulse pressure", "Aortic systolic pressure"]', 1, 'Easy', 5),
    (v_topic_id, 'Afterload is most closely related to:', '["Venous return", "Pressure the ventricle must overcome to eject blood", "End-diastolic filling volume", "Myocardial oxygen extraction", "Ventricular compliance only"]', 1, 'Easy', 6),
    (v_topic_id, 'An acute increase in afterload initially causes:', '["Increased stroke volume", "Decreased end-systolic volume", "Decreased stroke volume", "Increased ejection fraction", "Decreased ventricular pressure generation"]', 2, 'Medium', 7),
    (v_topic_id, 'The Frank-Starling mechanism states that:', '["Increased afterload increases stroke volume", "Increased ventricular filling increases stroke volume", "Increased heart rate always increases cardiac output", "Contractility depends only on sympathetic tone", "Venous return is independent of preload"]', 1, 'Easy', 8),
    (v_topic_id, 'The major cellular basis of the Frank-Starling mechanism is:', '["Reduced calcium entry into myocytes", "Improved actin-myosin interaction with increased fiber stretch", "Decreased sarcomere length", "Reduced ventricular compliance", "Decreased ATP availability"]', 1, 'Medium', 9),
    (v_topic_id, 'A positive inotropic effect means increased:', '["Heart rate", "Contractility", "Venous compliance", "Afterload", "Blood volume"]', 1, 'Easy', 10),
    (v_topic_id, 'Beta-1 adrenergic stimulation causes:', '["Decreased heart rate and decreased contractility", "Increased heart rate and increased contractility", "Increased venous compliance only", "Decreased AV nodal conduction", "Arteriolar dilation in all beds"]', 1, 'Easy', 11),
    (v_topic_id, 'Parasympathetic stimulation has its strongest direct effect on the:', '["Ventricular myocardium", "SA and AV nodes", "Aortic valve", "Pulmonary veins", "Left ventricular free wall"]', 1, 'Easy', 12),
    (v_topic_id, 'Increased vagal tone typically causes:', '["Tachycardia", "Bradycardia", "Strong increase in ventricular contractility", "Increased total peripheral resistance", "Increased ejection fraction in all cases"]', 1, 'Easy', 13),
    (v_topic_id, 'The normal pacemaker of the heart is the:', '["AV node", "SA node", "Bundle of His", "Purkinje fibers", "Left bundle branch"]', 1, 'Easy', 14),
    (v_topic_id, 'The PR interval represents conduction from the atria through the:', '["Ventricles only", "AV node and His bundle", "Semilunar valves", "Coronary arteries", "Purkinje fibers only"]', 1, 'Easy', 15),
    (v_topic_id, 'The QRS complex represents:', '["Atrial depolarization", "Ventricular depolarization", "Ventricular repolarization", "Atrial repolarization only", "AV nodal delay"]', 1, 'Easy', 16),
    (v_topic_id, 'The T wave represents:', '["Atrial depolarization", "Ventricular depolarization", "Ventricular repolarization", "Atrial contraction", "SA node firing"]', 2, 'Easy', 17),
    (v_topic_id, 'Physiologic conduction delay in the heart occurs mainly in the:', '["SA node", "AV node", "Bundle branches", "Purkinje system", "Ventricular myocardium"]', 1, 'Easy', 18),
    (v_topic_id, 'The main purpose of AV nodal delay is to allow:', '["Ventricular ejection before atrial systole", "Time for ventricular filling after atrial contraction", "Early aortic valve opening", "Coronary venous drainage", "Pulmonary venous emptying"]', 1, 'Easy', 19),
    (v_topic_id, 'The plateau phase of the ventricular action potential is mainly due to:', '["Rapid potassium influx", "Calcium influx through L-type channels", "Chloride influx", "Sudden sodium efflux", "Complete cessation of ion movement"]', 1, 'Medium', 20),
    (v_topic_id, 'The long refractory period of cardiac muscle helps prevent:', '["Bradycardia", "Tetanic contraction", "Coronary ischemia", "AV nodal delay", "Ventricular filling"]', 1, 'Easy', 21),
    (v_topic_id, 'S1 is caused by closure of the:', '["Aortic and pulmonary valves", "Mitral and tricuspid valves", "Aortic valve only", "Pulmonary valve only", "Coronary sinus"]', 1, 'Easy', 22),
    (v_topic_id, 'S1 occurs at the beginning of:', '["Ventricular filling", "Atrial systole", "Isovolumetric contraction", "Isovolumetric relaxation", "Rapid ventricular filling"]', 2, 'Easy', 23),
    (v_topic_id, 'S2 is caused by closure of the:', '["AV valves", "Semilunar valves", "Mitral valve only", "Tricuspid valve only", "Foramen ovale"]', 1, 'Easy', 24),
    (v_topic_id, 'During isovolumetric contraction:', '["Ventricular volume increases", "Ventricular volume remains constant while pressure rises", "Aortic valve is open", "Mitral valve is open", "Ventricular pressure falls"]', 1, 'Medium', 25),
    (v_topic_id, 'During isovolumetric relaxation:', '["Ventricular pressure rises at constant volume", "Ventricular pressure falls at constant volume", "Ventricular filling is maximal", "Aortic valve is open", "Stroke volume increases"]', 1, 'Medium', 26),
    (v_topic_id, 'The pressure-volume loop shifts rightward with an increase in:', '["End-diastolic volume", "Contractility only", "Heart rate only", "Aortic compliance only", "AV nodal conduction"]', 0, 'Medium', 27),
    (v_topic_id, 'An increase in contractility tends to:', '["Increase end-systolic volume", "Decrease stroke volume", "Decrease end-systolic volume", "Decrease ejection fraction", "Decrease ventricular systolic pressure"]', 2, 'Medium', 28),
    (v_topic_id, 'A patient who suddenly stands up from a supine position initially experiences:', '["Increased venous return", "Decreased venous return", "Increased central venous pressure", "Increased stroke volume", "Increased carotid sinus firing"]', 1, 'Easy', 29),
    (v_topic_id, 'The immediate reflex response to standing is mediated mainly by the:', '["Bainbridge reflex", "Baroreceptor reflex", "Cushing reflex", "Diving reflex", "Chemoreceptor reflex only"]', 1, 'Easy', 30),
    (v_topic_id, 'Baroreceptors are located primarily in the:', '["Coronary sinus and vena cava", "Carotid sinus and aortic arch", "Pulmonary veins and left atrium", "Renal afferent arteriole", "Right ventricle and pulmonary trunk only"]', 1, 'Easy', 31),
    (v_topic_id, 'Decreased baroreceptor firing leads to:', '["Decreased sympathetic outflow", "Increased vagal discharge", "Increased sympathetic and decreased parasympathetic activity", "Immediate ANP release", "Reduced renin secretion"]', 2, 'Medium', 32),
    (v_topic_id, 'In acute hemorrhage, the earliest major hemodynamic change is:', '["Increased total peripheral resistance", "Increased renin release", "Decreased venous return", "Increased aldosterone", "Increased ADH-mediated water retention"]', 2, 'Easy', 33),
    (v_topic_id, 'Renin is released by:', '["Macula densa cells", "Juxtaglomerular cells", "Hepatocytes", "Atrial myocytes", "Ventricular myocytes"]', 1, 'Easy', 34),
    (v_topic_id, 'During dynamic exercise, cardiac output increases mainly because of:', '["Decreased HR and increased SV", "Increased HR and increased SV", "Increased TPR only", "Decreased venous return", "Decreased sympathetic tone"]', 1, 'Easy', 35),
    (v_topic_id, 'During intense exercise, mixed venous oxygen content generally:', '["Increases", "Decreases", "Equals arterial oxygen content", "Remains fixed", "Depends only on hemoglobin concentration"]', 1, 'Medium', 36),
    (v_topic_id, 'The major contributor to increased venous return during exercise is:', '["Decreased respiratory movement", "Muscle pump activity", "Reduced sympathetic tone", "Reduced blood volume", "Increased venous compliance"]', 1, 'Easy', 37),
    (v_topic_id, 'Arterioles are called resistance vessels because they:', '["Contain most of the blood volume", "Provide the greatest resistance to blood flow", "Are the major site of gas exchange", "Have the highest compliance", "Have valves"]', 1, 'Easy', 38),
    (v_topic_id, 'Veins are called capacitance vessels because they:', '["Generate the highest pressure", "Hold a large proportion of total blood volume", "Are the main site of exchange", "Provide the greatest resistance", "Have the thickest walls"]', 1, 'Easy', 39),
    (v_topic_id, 'Compared with arteries, veins generally have:', '["Lower compliance", "Higher compliance", "Higher pulse pressure", "Greater wall thickness", "Greater resistance"]', 1, 'Easy', 40),
    (v_topic_id, 'Sympathetic venoconstriction tends to:', '["Decrease venous return", "Increase venous return", "Reduce mean systemic filling pressure", "Reduce preload to zero", "Decrease cardiac output in all cases"]', 1, 'Medium', 41),
    (v_topic_id, 'Coronary blood flow to the left ventricle occurs predominantly during:', '["Systole", "Diastole", "Atrial systole only", "Isovolumetric contraction", "End-systole only"]', 1, 'Easy', 42),
    (v_topic_id, 'Tachycardia can worsen myocardial ischemia because it:', '["Prolongs diastole", "Shortens diastole and reduces coronary perfusion time", "Decreases myocardial oxygen demand", "Eliminates afterload", "Increases subendocardial perfusion"]', 1, 'Medium', 43),
    (v_topic_id, 'Coronary blood flow is most closely matched to:', '["Myocardial oxygen demand", "Pulmonary blood flow", "Plasma sodium concentration", "Venous oxygen saturation only", "Left atrial pressure only"]', 0, 'Easy', 44),
    (v_topic_id, 'The “a wave” of the jugular venous pulse corresponds to:', '["Ventricular ejection", "Atrial contraction", "Venous filling against closed tricuspid valve", "Rapid ventricular filling", "Semilunar valve closure"]', 1, 'Easy', 45),
    (v_topic_id, 'The “v wave” of the jugular venous pulse reflects:', '["Atrial contraction", "Venous filling of the atrium while the tricuspid valve is closed", "Ventricular depolarization", "Aortic valve opening", "Pulmonary artery contraction"]', 1, 'Easy', 46),
    (v_topic_id, 'Pulmonary circulation normally has:', '["Higher pressure and higher resistance than systemic circulation", "Lower pressure and lower resistance than systemic circulation", "Higher pressure but lower flow", "Equal pressure and resistance to systemic circulation", "Lower compliance than systemic circulation"]', 1, 'Easy', 47),
    (v_topic_id, 'Hypoxic pulmonary vasoconstriction causes:', '["Dilation of vessels in poorly ventilated regions", "Constriction of vessels in poorly ventilated regions", "Reduced ventilation-perfusion matching", "Decreased pulmonary arterial pressure in all cases", "Increased systemic vascular resistance"]', 1, 'Medium', 48),
    (v_topic_id, 'Early distributive shock is characterized by:', '["Increased total peripheral resistance", "Decreased total peripheral resistance", "Failure of cardiac pumping", "Loss of circulating blood volume", "Increased preload"]', 1, 'Easy', 49),
    (v_topic_id, 'According to the Fick principle, cardiac output equals:', '["Oxygen consumption ÷ arteriovenous oxygen difference", "Arteriovenous oxygen difference ÷ oxygen consumption", "Heart rate × mean arterial pressure", "Stroke volume ÷ end-diastolic volume", "Total peripheral resistance × oxygen consumption"]', 0, 'Medium', 50),
    (v_topic_id, 'Aortic stenosis primarily imposes:', '["Volume overload on the left ventricle", "Pressure overload on the left ventricle", "Volume overload on the right ventricle", "Pressure overload on the left atrium", "Reduced afterload on the left ventricle"]', 1, 'Easy', 51),
    (v_topic_id, 'The classic structural adaptation to chronic aortic stenosis is:', '["Eccentric hypertrophy", "Concentric hypertrophy", "Acute dilation without hypertrophy", "Right ventricular hypertrophy", "Atrial septal thickening only"]', 1, 'Easy', 52),
    (v_topic_id, 'Mitral regurgitation causes abnormal blood flow during systole from the:', '["Left atrium to left ventricle", "Left ventricle to left atrium", "Aorta to left ventricle", "Right ventricle to right atrium", "Pulmonary artery to right ventricle"]', 1, 'Easy', 53),
    (v_topic_id, 'Chronic mitral regurgitation most commonly leads to:', '["Pressure overload with concentric LV hypertrophy", "Volume overload with eccentric LV hypertrophy", "Decreased left atrial volume", "Reduced pulmonary venous pressure", "Isolated right ventricular hypertrophy first"]', 1, 'Medium', 54),
    (v_topic_id, 'Aortic regurgitation is most strongly associated with:', '["Narrow pulse pressure", "Wide pulse pressure", "Fixed split S2", "Pulsus paradoxus only", "Decreased stroke volume without compensation"]', 1, 'Easy', 55),
    (v_topic_id, 'In chronic aortic regurgitation, the left ventricle typically develops:', '["Concentric hypertrophy only", "Eccentric hypertrophy due to volume overload", "No remodeling", "Isolated atrial hypertrophy", "Restrictive filling without dilation"]', 1, 'Medium', 56),
    (v_topic_id, 'A holosystolic murmur radiating to the axilla is most characteristic of:', '["Aortic stenosis", "Mitral regurgitation", "Aortic regurgitation", "Mitral stenosis", "Pulmonic stenosis"]', 1, 'Easy', 57),
    (v_topic_id, 'A systolic ejection murmur radiating to the carotids is most suggestive of:', '["Mitral regurgitation", "Aortic stenosis", "Tricuspid regurgitation", "Ventricular septal defect", "Aortic regurgitation"]', 1, 'Easy', 58),
    (v_topic_id, 'A high-pitched early diastolic decrescendo murmur is most consistent with:', '["Aortic regurgitation", "Mitral regurgitation", "Aortic stenosis", "Mitral valve prolapse", "Hypertrophic cardiomyopathy"]', 0, 'Medium', 59),
    (v_topic_id, 'In systolic heart failure, ejection fraction is usually:', '["Increased", "Decreased", "Always normal", "Equal to pulse pressure", "Greater than 80%"]', 1, 'Easy', 60),
    (v_topic_id, 'In left-sided systolic heart failure, which variable is commonly elevated?', '["Pulmonary capillary wedge pressure", "Plasma oncotic pressure", "Systemic venous oxygen saturation only", "Aortic compliance", "Renal perfusion pressure only after diuresis"]', 0, 'Medium', 61),
    (v_topic_id, 'RAAS activation in heart failure tends to:', '["Reduce sodium and water retention", "Worsen fluid retention", "Decrease aldosterone secretion", "Lower venous tone", "Reduce afterload only with no effect on volume"]', 1, 'Easy', 62),
    (v_topic_id, 'Edema in congestive heart failure develops primarily because of increased:', '["Plasma oncotic pressure", "Capillary hydrostatic pressure", "Lymphatic drainage", "Interstitial hydrostatic pressure", "Albumin synthesis"]', 1, 'Easy', 63),
    (v_topic_id, 'Plasma albumin normally favors:', '["Filtration out of the capillary", "Reabsorption into the capillary", "Increased capillary hydrostatic pressure", "Increased capillary permeability", "Venoconstriction"]', 1, 'Easy', 64),
    (v_topic_id, 'A patient with preserved ejection fraction but impaired ventricular filling most likely has:', '["Pure systolic dysfunction", "Diastolic dysfunction", "Early distributive shock", "High-output failure only", "Severe tricuspid stenosis only"]', 1, 'Medium', 65),
    (v_topic_id, 'Diastolic dysfunction is commonly associated with:', '["Dilated thin-walled ventricle", "Concentric hypertrophy and reduced compliance", "Markedly reduced afterload", "Severe hypovolemia", "Increased venous compliance"]', 1, 'Medium', 66),
    (v_topic_id, 'Coronary perfusion to the left ventricle is reduced during tachycardia mainly because:', '["Systole is prolonged preferentially", "Diastole is shortened", "Aortic pressure always falls", "Myocardial oxygen demand decreases", "Venous return falls to zero"]', 1, 'Easy', 67),
    (v_topic_id, 'The subendocardium is particularly susceptible to ischemia because it:', '["Is compressed most during systole", "Has the highest systolic perfusion", "Has no capillary supply", "Depends only on right coronary flow", "Has the lowest oxygen demand"]', 0, 'Medium', 68),
    (v_topic_id, 'The Bainbridge reflex is triggered primarily by:', '["Reduced carotid sinus stretch", "Increased atrial filling/stretch", "Increased intracranial pressure", "Decreased ventricular contractility", "Hypoxic pulmonary vasoconstriction"]', 1, 'Medium', 69),
    (v_topic_id, 'The Bainbridge reflex tends to cause:', '["Bradycardia", "Tachycardia", "Decreased venous return", "Decreased atrial pressure", "Immediate arteriolar dilation in the brain only"]', 1, 'Easy', 70),
    (v_topic_id, 'According to Poiseuille’s law, vascular resistance is most sensitive to changes in:', '["Vessel length", "Vessel radius", "Blood density", "Heart rate", "Pulse pressure"]', 1, 'Easy', 71),
    (v_topic_id, 'If vessel radius decreases, resistance will:', '["Decrease", "Increase markedly", "Stay unchanged", "Become zero", "Depend only on viscosity no longer"]', 1, 'Easy', 72),
    (v_topic_id, 'Sympathetic stimulation of arterioles generally causes:', '["Reduced total peripheral resistance", "Increased total peripheral resistance", "Increased venous compliance", "Reduced mean arterial pressure", "Reduced afterload in all organs"]', 1, 'Easy', 73),
    (v_topic_id, 'Mean systemic filling pressure increases with:', '["Hemorrhage", "Increased blood volume or venoconstriction", "Reduced sympathetic tone", "Severe dehydration", "Decreased stressed volume"]', 1, 'Medium', 74),
    (v_topic_id, 'Venous return is greatest when:', '["Right atrial pressure is high relative to mean systemic filling pressure", "Right atrial pressure is low relative to mean systemic filling pressure", "Right atrial pressure equals left ventricular pressure", "Arterial pressure is zero", "Pulmonary venous pressure exceeds aortic pressure"]', 1, 'Medium', 75),
    (v_topic_id, 'At steady state, venous return must equal:', '["Total peripheral resistance", "Cardiac output", "Pulse pressure", "Mean systemic filling pressure", "End-systolic volume"]', 1, 'Easy', 76),
    (v_topic_id, 'A rightward shift of the cardiac function curve most likely reflects:', '["Decreased contractility", "Increased contractility", "Decreased blood volume", "Reduced venous return", "Increased parasympathetic tone only"]', 1, 'Medium', 77),
    (v_topic_id, 'Acute hemorrhage causes the venous return curve to shift:', '["Rightward", "Leftward", "Upward only", "Downward only without leftward shift", "Not at all"]', 1, 'Easy', 78),
    (v_topic_id, 'Early distributive shock is often associated with:', '["Cold clammy skin", "Warm flushed extremities", "Increased TPR", "Markedly reduced skin perfusion", "Severe bradycardia"]', 1, 'Easy', 79),
    (v_topic_id, 'Cardiogenic shock is primarily caused by:', '["Severe vasodilation", "Failure of cardiac pumping", "Loss of circulating blood volume", "Decreased venous capacitance", "Histamine release only"]', 1, 'Easy', 80),
    (v_topic_id, 'Hypovolemic shock differs from distributive shock because hypovolemic shock begins with:', '["Loss of circulating volume", "Decreased TPR as the primary event", "Increased cardiac output", "Warm peripheries", "Increased venous return"]', 0, 'Easy', 81),
    (v_topic_id, 'In obstructive shock due to cardiac tamponade, cardiac output falls mainly because of:', '["Reduced contractility", "Impaired ventricular filling", "Severe aortic regurgitation", "Increased ejection fraction", "Reduced systemic resistance"]', 1, 'Medium', 82),
    (v_topic_id, 'Cardiac tamponade most directly reduces:', '["End-diastolic filling", "Ventricular contractility", "Aortic valve competence", "Myocardial oxygen extraction", "Arteriolar tone"]', 0, 'Medium', 83),
    (v_topic_id, 'In atrial fibrillation, which JVP wave is absent?', '["c wave", "v wave", "a wave", "x descent", "y descent"]', 2, 'Easy', 84),
    (v_topic_id, 'The v wave in the jugular venous pulse corresponds to:', '["Atrial contraction", "Venous filling of the right atrium against a closed tricuspid valve", "Ventricular depolarization", "Ventricular rapid filling", "Pulmonary valve closure"]', 1, 'Easy', 85),
    (v_topic_id, 'Pulmonary circulation differs from systemic circulation in that it normally has:', '["Higher pressure and higher resistance", "Lower pressure and lower resistance", "Equal pressure but lower flow", "Lower compliance", "Greater oxygen extraction per unit tissue mass in all cases"]', 1, 'Easy', 86),
    (v_topic_id, 'Hypoxic pulmonary vasoconstriction is beneficial because it:', '["Increases blood flow to poorly ventilated alveoli", "Diverts blood away from poorly ventilated regions", "Decreases ventilation-perfusion matching", "Lowers pulmonary vascular resistance everywhere", "Increases systemic arterial vasoconstriction"]', 1, 'Medium', 87),
    (v_topic_id, 'Diffuse alveolar hypoxia tends to:', '["Lower pulmonary vascular resistance", "Raise pulmonary vascular resistance", "Leave pulmonary circulation unchanged", "Reduce right ventricular afterload", "Increase left ventricular contractility directly"]', 1, 'Medium', 88),
    (v_topic_id, 'The right ventricle normally has a thinner wall than the left ventricle because it pumps against:', '["Lower afterload", "Lower preload", "Lower heart rate", "Higher resistance", "Lower coronary flow only"]', 0, 'Easy', 89),
    (v_topic_id, 'The Fick principle states that cardiac output equals:', '["Oxygen consumption ÷ arteriovenous oxygen difference", "Arteriovenous oxygen difference ÷ oxygen consumption", "Stroke volume ÷ end-diastolic volume", "Heart rate × mean arterial pressure", "Total peripheral resistance × oxygen consumption"]', 0, 'Medium', 90),
    (v_topic_id, 'If oxygen consumption remains constant but arteriovenous oxygen difference increases, cardiac output:', '["Increases", "Decreases", "Remains unchanged", "Becomes equal to stroke volume", "Becomes independent of tissue extraction"]', 1, 'Medium', 91),
    (v_topic_id, 'In a patient with low cardiac output, tissues partially compensate by:', '["Extracting less oxygen", "Extracting more oxygen", "Lowering arterial oxygen content", "Decreasing hemoglobin concentration", "Reducing venous return"]', 1, 'Medium', 92),
    (v_topic_id, 'During exercise, skeletal muscle blood flow rises mainly because of:', '["Local metabolic vasodilation", "Generalized alpha-1 vasoconstriction", "Reduced cardiac output", "Reduced venous return", "Decreased oxygen extraction"]', 0, 'Easy', 93),
    (v_topic_id, 'During dynamic exercise, renal blood flow generally:', '["Increases markedly", "Decreases relative to resting levels", "Equals coronary blood flow", "Becomes independent of sympathetic tone", "Rises due to ANP release"]', 1, 'Easy', 94),
    (v_topic_id, 'Atrial natriuretic peptide is released in response to:', '["Decreased atrial stretch", "Increased atrial stretch", "Increased carotid sinus firing", "Decreased blood volume", "Reduced sodium delivery to the distal tubule"]', 1, 'Easy', 95),
    (v_topic_id, 'ANP tends to:', '["Promote sodium retention", "Promote natriuresis and oppose RAAS", "Increase aldosterone release", "Increase ADH release directly", "Increase total peripheral resistance markedly"]', 1, 'Easy', 96),
    (v_topic_id, 'During inspiration, physiologic splitting of S2 becomes more apparent because:', '["Aortic valve closes earlier", "Pulmonic valve closure is delayed", "Mitral valve closes later", "Left ventricular ejection time lengthens more than right", "Atrial contraction becomes stronger"]', 1, 'Medium', 97),
    (v_topic_id, 'A decrease in ventricular compliance means that for any given filling volume, ventricular:', '["Pressure is lower", "Pressure is higher", "Contractility is higher", "Afterload is lower", "Ejection fraction must be lower"]', 1, 'Medium', 98),
    (v_topic_id, 'An increase in contractility on a pressure-volume loop would most likely:', '["Increase end-systolic volume", "Decrease end-systolic volume", "Decrease stroke volume", "Shift the filling curve downward", "Reduce systolic pressure generation"]', 1, 'Medium', 99),
    (v_topic_id, 'Which combination is most consistent with chronic hypertension?', '["Reduced afterload, eccentric hypertrophy, increased compliance", "Increased afterload, concentric hypertrophy, reduced compliance", "Reduced preload, dilated ventricle, low wall thickness", "Increased venous compliance, reduced MAP, eccentric remodeling", "Low arterial pressure, preserved wall thickness, increased stroke volume only"]', 1, 'Hard', 100);

END $$;
