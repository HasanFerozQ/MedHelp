const fs = require('fs');
const p1Cases = require('./generate_derm_malignancies_p1.js');
const p2Cases = require('./generate_derm_malignancies_p2.js');

const cases = [...p1Cases, ...p2Cases].slice(0, 50);

const generateSQL = () => {
  let sql = `-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: Skin malignancies — melanoma, BCC, SCC
-- Topic Slug: derm-malignancies
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-malignancies';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, consistent upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

`;

  cases.forEach((c, idx) => {
    const title = c.title.replace(/'/g, "''");
    const scenario = c.scenario.replace(/'/g, "''");
    const disease = c.disease ? c.disease.replace(/'/g, "''") : "Malignancy";
    
    sql += `    ---------------------------------------------------------------------------
    -- CASE ${String(idx + 1).padStart(2, '0')}: ${disease}
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '${title}' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, '${title}', '${scenario}', ${idx + 1}) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '${scenario}', "order" = ${idx + 1} WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
`;

    c.questions.forEach((q, qIdx) => {
      const question = q.q.replace(/'/g, "''");
      const options = JSON.stringify(q.options).replace(/'/g, "''");
      const explanation = q.exp.replace(/'/g, "''");
      sql += `        (v_case_id, '${question}', '${options}', ${q.ans}, '${explanation}')${qIdx === c.questions.length - 1 ? ';' : ','}\n`;
    });
    sql += `\n`;
  });

  sql += `END $$;
COMMIT;`;

  return sql;
};

const finalSQL = generateSQL();
fs.writeFileSync('c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\derm_malignancies_caseblocks_50.sql', finalSQL);
console.log("Successfully wrote derm_malignancies_caseblocks_50.sql!");
