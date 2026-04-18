DO $$
DECLARE
    v_topic_id UUID;
    -- Try to find Semester 1 or Semester 2? Let's use Semester 1.
    v_semester_id INTEGER := 1;
BEGIN
    -- 1. Check if the topic exists
    SELECT id INTO v_topic_id FROM public.topics WHERE title = 'PELVIS & PERINEUM' LIMIT 1;
    
    -- 2. If topic doesn't exist, create it
    IF v_topic_id IS NULL THEN
        -- Find a semester, if 1 doesn't exist just use whatever is min
        SELECT id INTO v_semester_id FROM public.semesters ORDER BY id LIMIT 1;
        
        INSERT INTO public.topics (semester_id, title, "order")
        VALUES (v_semester_id, 'PELVIS & PERINEUM', (SELECT COALESCE(MAX("order"), 0) + 1 FROM public.topics WHERE semester_id = v_semester_id))
        RETURNING id INTO v_topic_id;
    END IF;

    -- 3. Insert the MCQs

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        '1.

Which structure forms the main support of the pelvic floor?', 
        NULL, 
        '["Piriformis", "Levator ani", "Obturator internus", "Gluteus maximus"]'::jsonb, 
        1, 
        nullif('Levator ani is the primary pelvic diaphragm muscle.', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle is NOT part of levator ani?', 
        NULL, 
        '["Puborectalis", "Pubococcygeus", "Iliococcygeus", "Piriformis"]'::jsonb, 
        3, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure maintains the anorectal angle?', 
        NULL, 
        '["External anal sphincter", "Puborectalis", "Internal sphincter", "Coccygeus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve supplies most of the perineum?', 
        NULL, 
        '["Obturator", "Pudendal", "Femoral", "Sciatic"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'The pudendal nerve originates from which spinal levels?', 
        NULL, 
        '["L1\u2013L3", "L2\u2013L4", "S2\u2013S4", "T12\u2013L2"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which foramen does the pudendal nerve exit the pelvis through first?', 
        NULL, 
        '["Lesser sciatic", "Greater sciatic", "Obturator", "Femoral"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is used as a landmark for pudendal nerve block?', 
        NULL, 
        '["ASIS", "Ischial spine", "Pubic symphysis", "Sacrum"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery accompanies the pudendal nerve?', 
        NULL, 
        '["Femoral artery", "Internal pudendal artery", "External iliac artery", "Obturator artery"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which space contains fat allowing expansion during childbirth?', 
        NULL, 
        '["Deep perineal pouch", "Superficial pouch", "Ischioanal fossa", "Rectovesical pouch"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure passes through the ischioanal fossa?', 
        NULL, 
        '["Ureter", "Pudendal canal", "Uterine artery", "Rectum"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which pouch is the lowest point in the female pelvis?', 
        NULL, 
        '["Vesicouterine", "Rectouterine", "Rectovesical", "Lesser sac"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'In males, the lowest peritoneal pouch is:', 
        NULL, 
        '["Rectouterine", "Vesicouterine", "Rectovesical", "Pelvic cavity"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure connects uterus to lateral pelvic wall?', 
        NULL, 
        '["Round ligament", "Broad ligament", "Cardinal ligament", "Suspensory ligament"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which ligament contains the ovarian vessels?', 
        NULL, 
        '["Broad ligament", "Round ligament", "Suspensory ligament of ovary", "Falciform ligament"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the uterus?', 
        NULL, 
        '["Ovarian artery", "Internal iliac artery (via uterine branch)", "External iliac artery", "SMA"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'The uterine artery crosses which structure?', 
        NULL, 
        '["Ureter", "Bladder", "Rectum", "Ovary"]'::jsonb, 
        0, 
        nullif('“Water under the bridge” — ureter passes under uterine artery.', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure stores urine?', 
        NULL, 
        '["Ureter", "Bladder", "Urethra", "Kidney"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle forms the bladder wall?', 
        NULL, 
        '["Levator ani", "Detrusor", "Puborectalis", "Obturator internus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Parasympathetic supply to the bladder arises from:', 
        NULL, 
        '["T10\u2013L1", "L1\u2013L2", "S2\u2013S4", "C3\u2013C5"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is compressed in prostate enlargement?', 
        NULL, 
        '["Ureter", "Prostatic urethra", "Bladder wall", "Rectum"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which part of prostate is commonly enlarged in BPH?', 
        NULL, 
        '["Peripheral zone", "Central zone", "Transitional zone", "Posterior lobe"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which part of prostate is commonly affected by cancer?', 
        NULL, 
        '["Transitional", "Peripheral posterior", "Central", "Anterior"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which line separates visceral vs somatic innervation in anal canal?', 
        NULL, 
        '["White line", "Pectinate line", "Perineal body", "Pelvic brim"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Internal hemorrhoids occur:', 
        NULL, 
        '["Below pectinate line", "Above pectinate line", "In rectum only", "In colon only"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'External hemorrhoids are painful because they are supplied by:', 
        NULL, 
        '["Autonomic nerves", "Pudendal nerve", "Vagus nerve", "Sympathetic trunk"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms the anterior boundary of the deep perineal pouch?', 
        NULL, 
        '["Perineal membrane", "Levator ani", "Skin", "Colles fascia"]'::jsonb, 
        0, 
        nullif('Deep pouch lies above the perineal membrane.', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is found in the deep perineal pouch (male)?', 
        NULL, 
        '["Testis", "Bulbourethral glands", "Penis shaft", "Epididymis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is found in the superficial perineal pouch (male)?', 
        NULL, 
        '["Prostate", "Membranous urethra", "Bulb of penis", "Bladder"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which part of male urethra is shortest?', 
        NULL, 
        '["Prostatic", "Membranous", "Spongy", "Penile"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which part of male urethra is most dilatable?', 
        NULL, 
        '["Membranous", "Prostatic", "Spongy", "External meatus"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which gland contributes most fluid to semen?', 
        NULL, 
        '["Prostate", "Seminal vesicle", "Bulbourethral", "Testis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Where do ejaculatory ducts open?', 
        NULL, 
        '["Bladder", "Prostatic urethra", "Membranous urethra", "Spongy urethra"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure lies posterior to bladder in males?', 
        NULL, 
        '["Rectum", "Prostate", "Penis", "Urethra"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure lies anterior to rectum in females?', 
        NULL, 
        '["Bladder", "Uterus", "Ovary", "Ureter"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which ligament maintains anteversion of uterus?', 
        NULL, 
        '["Broad ligament", "Round ligament", "Cardinal ligament", "Suspensory ligament"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which ligament provides strongest support to cervix?', 
        NULL, 
        '["Round ligament", "Cardinal ligament", "Broad ligament", "Ovarian ligament"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure carries lymph from testes?', 
        NULL, 
        '["Superficial inguinal nodes", "Deep inguinal nodes", "Lumbar (para-aortic) nodes", "Internal iliac nodes"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which lymph nodes drain scrotum?', 
        NULL, 
        '["Para-aortic", "Superficial inguinal", "Deep pelvic", "Internal iliac"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the ovary?', 
        NULL, 
        '["Uterine artery", "Ovarian artery", "Internal iliac", "External iliac"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies inferior rectum?', 
        NULL, 
        '["Superior rectal", "Middle rectal", "Inferior rectal", "Internal iliac"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms pelvic diaphragm with levator ani?', 
        NULL, 
        '["Piriformis", "Coccygeus", "Obturator internus", "Gluteus maximus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle lines lateral pelvic wall?', 
        NULL, 
        '["Levator ani", "Piriformis", "Obturator internus", "Coccygeus"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle passes through greater sciatic foramen?', 
        NULL, 
        '["Obturator internus", "Piriformis", "Levator ani", "Coccygeus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure exits below piriformis?', 
        NULL, 
        '["Superior gluteal nerve", "Inferior gluteal nerve", "Obturator nerve", "Femoral nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which fascia limits spread of urine into thigh?', 
        NULL, 
        '["Camper\u2019s fascia", "Scarpa fascia", "Dartos fascia", "Colles fascia"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure anchors perineal membrane?', 
        NULL, 
        '["Pubic bone", "Sacrum", "Ischium", "Coccyx"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which organ lies inferior to bladder in males?', 
        NULL, 
        '["Rectum", "Prostate", "Urethra", "Penis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which organ lies posterior to uterus?', 
        NULL, 
        '["Bladder", "Rectum", "Ovary", "Ureter"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is most commonly injured in pelvic fracture?', 
        NULL, 
        '["Ureter", "Membranous urethra", "Bladder dome", "Testis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure contributes to erection?', 
        NULL, 
        '["Sympathetic only", "Parasympathetic (S2\u2013S4)", "Somatic only", "Vagus nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is part of the posterior division of the internal iliac artery?', 
        NULL, 
        '["Uterine artery", "Superior gluteal artery", "Obturator artery", "Internal pudendal artery"]'::jsonb, 
        1, 
        nullif('Posterior division → iliolumbar, lateral sacral, superior gluteal.', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the gluteus maximus?', 
        NULL, 
        '["Superior gluteal", "Inferior gluteal", "Obturator", "Femoral"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve exits the pelvis via greater sciatic foramen ABOVE piriformis?', 
        NULL, 
        '["Inferior gluteal", "Sciatic", "Superior gluteal", "Pudendal"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve exits BELOW piriformis?', 
        NULL, 
        '["Superior gluteal", "Inferior gluteal", "Obturator", "Femoral"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure lies medial to the obturator canal?', 
        NULL, 
        '["Femoral artery", "External iliac artery", "Obturator nerve and vessels", "Pudendal nerve"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is most vulnerable in obturator hernia?', 
        NULL, 
        '["Femoral nerve", "Obturator nerve", "Sciatic nerve", "Pudendal nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery passes through the lesser sciatic foramen?', 
        NULL, 
        '["Femoral artery", "Internal pudendal artery", "External iliac artery", "Renal artery"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms the lateral wall of ischioanal fossa?', 
        NULL, 
        '["Levator ani", "Obturator internus", "Coccygeus", "Rectum"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms the medial wall of ischioanal fossa?', 
        NULL, 
        '["Obturator internus", "Levator ani", "Gluteus maximus", "Piriformis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is located in the superficial perineal pouch (female)?', 
        NULL, 
        '["Cervix", "Clitoris", "Ovary", "Uterus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure anchors the penis to the pelvis?', 
        NULL, 
        '["Suspensory ligament", "Round ligament", "Broad ligament", "Inguinal ligament"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which erectile tissue surrounds urethra in males?', 
        NULL, 
        '["Corpus cavernosum", "Corpus spongiosum", "Tunica albuginea", "Dartos"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure drains venous blood from penis to prostatic plexus?', 
        NULL, 
        '["Deep dorsal vein", "Superficial dorsal vein", "Femoral vein", "Portal vein"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve supplies motor innervation to external urethral sphincter?', 
        NULL, 
        '["Pudendal nerve", "Vagus nerve", "Sympathetic trunk", "Obturator nerve"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is responsible for ejaculation (emission phase)?', 
        NULL, 
        '["Parasympathetic fibers", "Sympathetic fibers", "Pudendal nerve", "Femoral nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure provides sensory innervation to anterior scrotum?', 
        NULL, 
        '["Pudendal nerve", "Ilioinguinal nerve", "Femoral nerve", "Sciatic nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve supplies posterior scrotum?', 
        NULL, 
        '["Ilioinguinal", "Pudendal", "Femoral", "Obturator"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which ligament forms the boundary of greater sciatic foramen?', 
        NULL, 
        '["Sacrospinous ligament", "Inguinal ligament", "Round ligament", "Broad ligament"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure divides greater and lesser sciatic foramina?', 
        NULL, 
        '["Sacrotuberous ligament", "Sacrospinous ligament", "Iliolumbar ligament", "Inguinal ligament"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which organ is most anterior in female pelvis?', 
        NULL, 
        '["Rectum", "Uterus", "Bladder", "Ovary"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure lies between bladder and uterus?', 
        NULL, 
        '["Rectouterine pouch", "Vesicouterine pouch", "Lesser sac", "Broad ligament"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure supports posterior vaginal wall?', 
        NULL, 
        '["Levator ani", "Obturator internus", "Piriformis", "Coccygeus"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the penis/clitoris?', 
        NULL, 
        '["External iliac", "Internal pudendal artery", "Femoral artery", "Renal artery"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve injury causes loss of erection?', 
        NULL, 
        '["Sympathetic trunk", "Pelvic splanchnic nerves", "Femoral nerve", "Obturator nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is the main venous drainage of pelvis?', 
        NULL, 
        '["Portal vein", "Internal iliac veins", "Femoral vein", "Renal vein"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which branch of internal iliac artery supplies the bladder?', 
        NULL, 
        '["Inferior mesenteric", "Superior vesical artery", "Renal artery", "Splenic artery"]'::jsonb, 
        1, 
        nullif('Superior vesical artery supplies bladder.', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the inferior part of bladder in males?', 
        NULL, 
        '["Uterine artery", "Inferior vesical artery", "Femoral artery", "SMA"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery replaces inferior vesical artery in females?', 
        NULL, 
        '["Ovarian artery", "Uterine artery", "Internal pudendal", "External iliac"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms the pelvic inlet boundary posteriorly?', 
        NULL, 
        '["Pubic symphysis", "Sacral promontory", "Iliac crest", "Coccyx"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms the pelvic outlet anteriorly?', 
        NULL, 
        '["Sacrum", "Pubic arch", "Iliac crest", "Lumbar vertebra"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle helps form the urogenital diaphragm?', 
        NULL, 
        '["Levator ani", "Deep transverse perineal muscle", "Piriformis", "Gluteus medius"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which fascia encloses the prostate?', 
        NULL, 
        '["Camper fascia", "Prostatic fascia", "Endopelvic fascia", "Scarpa fascia"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is located in the prostatic urethra?', 
        NULL, 
        '["External urethral sphincter", "Seminal colliculus", "Bulbourethral duct", "Penile urethra"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure carries sperm from epididymis to ejaculatory duct?', 
        NULL, 
        '["Urethra", "Vas deferens", "Prostate", "Seminal vesicle"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is pierced by vas deferens before entering prostate?', 
        NULL, 
        '["Bladder wall", "Seminal vesicle", "Prostate capsule", "Pelvic diaphragm"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which ligament attaches ovary to uterus?', 
        NULL, 
        '["Suspensory ligament", "Ovarian ligament", "Round ligament", "Broad ligament"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is part of broad ligament?', 
        NULL, 
        '["Mesosalpinx", "Falciform ligament", "Coronary ligament", "Omentum"]'::jsonb, 
        0, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which part of broad ligament encloses uterine tube?', 
        NULL, 
        '["Mesovarium", "Mesometrium", "Mesosalpinx", "Mesocolon"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure forms fibrous support for pelvic organs?', 
        NULL, 
        '["Peritoneum", "Endopelvic fascia", "Muscle only", "Skin"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which nerve supplies levator ani?', 
        NULL, 
        '["Femoral", "Pudendal", "Nerve to levator ani (S3\u2013S4)", "Sciatic"]'::jsonb, 
        2, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which artery supplies the vagina?', 
        NULL, 
        '["Uterine artery", "Vaginal artery", "Internal pudendal artery", "All of the above"]'::jsonb, 
        3, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which venous plexus surrounds the prostate?', 
        NULL, 
        '["Pampiniform plexus", "Prostatic venous plexus", "Portal plexus", "Renal plexus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure communicates with vertebral venous plexus?', 
        NULL, 
        '["Femoral vein", "Prostatic venous plexus", "Portal vein", "Renal vein"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which condition spreads via Batson plexus?', 
        NULL, 
        '["Kidney stones", "Prostate cancer", "Gallstones", "Appendicitis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle compresses crus of penis to maintain erection?', 
        NULL, 
        '["Bulbospongiosus", "Ischiocavernosus", "Levator ani", "Obturator internus"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which muscle compresses bulb of penis?', 
        NULL, 
        '["Ischiocavernosus", "Bulbospongiosus", "Levator ani", "Piriformis"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure supports urethra in females?', 
        NULL, 
        '["Levator ani", "Perineal membrane", "Endopelvic fascia", "All of the above"]'::jsonb, 
        3, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure prevents prolapse of pelvic organs?', 
        NULL, 
        '["Ligaments only", "Muscles only", "Fascia only", "Combined pelvic support system"]'::jsonb, 
        3, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is involved in erection (parasympathetic)?', 
        NULL, 
        '["Hypogastric plexus", "Pelvic splanchnic nerves", "Sympathetic trunk", "Pudendal nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

    INSERT INTO public.mcqs (topic_id, question, image_url, options, correct_index, explanation)
    VALUES (
        v_topic_id, 
        'Which structure is involved in ejaculation (sympathetic)?', 
        NULL, 
        '["Pelvic splanchnic", "Hypogastric nerves", "Femoral nerve", "Obturator nerve"]'::jsonb, 
        1, 
        nullif('', '')
    );

END $$;
