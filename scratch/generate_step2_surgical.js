const fs = require('fs');
const path = require('path');

const p1 = require('./generate_step2_surgical_p1.js');
const p2 = require('./generate_step2_surgical_p2.js');
const p3 = require('./generate_step2_surgical_p3.js');

const allCases = [...p1, ...p2, ...p3].slice(0, 80);

const topicSlug = 'case-surgical-medical';
const topicTitle = 'Surgical vs medical decision making';

let sql = `-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: ${topicTitle}
-- Topic Slug: ${topicSlug}
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = '${topicSlug}' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', '${topicSlug}';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

`;

allCases.forEach((c, idx) => {
    const caseNum = (idx + 1).toString().padStart(2, '0');
    const escapedScenario = c.scenario.replace(/'/g, "''");
    const escapedTitle = c.title.replace(/'/g, "''");

    sql += `    ---------------------------------------------------------------------------
    -- CASE ${caseNum}: ${escapedTitle}
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '${escapedTitle}', '${escapedScenario}', ${idx + 1})
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
`;

    c.questions.forEach((q, qIdx) => {
        const escapedQ = q.q.replace(/'/g, "''");
        const escapedExp = q.exp.replace(/'/g, "''");
        const optionsJson = JSON.stringify(q.options).replace(/'/g, "''");
        
        sql += `        (v_case_id, '${escapedQ}', '${optionsJson}', ${q.ans}, '${escapedExp}')${qIdx === c.questions.length - 1 ? ';' : ','}\n`;
    });

    sql += `\n`;
});

sql += `    RAISE NOTICE 'Finished populating ${allCases.length} cases for ${topicSlug}.';
END $$;

COMMIT;
`;

fs.writeFileSync(path.join(__dirname, '../step2_ck_surgical_caseblocks_80.sql'), sql);
console.log(`Successfully generated step2_ck_surgical_caseblocks_80.sql with ${allCases.length} cases.`);
