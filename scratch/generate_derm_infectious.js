const fs = require('fs');
const path = require('path');

const p1 = require('./generate_derm_infectious_p1.js');
const p2 = require('./generate_derm_infectious_p2.js');

const allCases = [...p1, ...p2].slice(0, 50);

const topicSlug = 'derm-infectious';
const topicTitle = 'Infectious dermatology — cellulitis, impetigo, fungal';

let sql = `-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: ${topicTitle}
-- Topic Slug: ${topicSlug}
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

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

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
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

fs.writeFileSync(path.join(__dirname, '../derm_infectious_caseblocks_50.sql'), sql);
console.log(`Successfully generated derm_infectious_caseblocks_50.sql with ${allCases.length} cases.`);
