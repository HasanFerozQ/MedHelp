import json
import random

# Topic Slug mappings for all 16 Geriatrics topics
topics_config = {
    "falls": {"slug": "geri-falls", "filename": "geriatrics_falls_caseblocks_50.sql", "title_prefix": "Falls & Gait Disorders"},
    "delirium_dementia": {"slug": "geri-delirium-dementia", "filename": "geriatrics_delirium_dementia_caseblocks_50.sql", "title_prefix": "Delirium & Dementia"},
    "polypharmacy": {"slug": "geri-polypharmacy", "filename": "geriatrics_polypharmacy_caseblocks_50.sql", "title_prefix": "Polypharmacy & Deprescribing"},
    "aging_changes": {"slug": "geri-aging-changes", "filename": "geriatrics_aging_changes_caseblocks_50.sql", "title_prefix": "Physiological Aging"},
    "pkpd": {"slug": "geri-pharmacokinetic-shifts", "filename": "geriatrics_pkpd_shifts_caseblocks_50.sql", "title_prefix": "PK/PD Shifts"},
    "incontinence": {"slug": "geri-incontinence", "filename": "geriatrics_incontinence_caseblocks_50.sql", "title_prefix": "Urinary Incontinence"},
    "pressure_ulcers": {"slug": "geri-pressure-ulcers", "filename": "geriatrics_pressure_ulcers_caseblocks_50.sql", "title_prefix": "Pressure Ulcers"},
    "malnutrition": {"slug": "geri-malnutrition", "filename": "geriatrics_malnutrition_caseblocks_50.sql", "title_prefix": "Malnutrition & Failure to Thrive"},
    "cognitive": {"slug": "geri-cognitive-disorders", "filename": "geriatrics_cognitive_caseblocks_50.sql", "title_prefix": "Cognitive Disorders"},
    "functional": {"slug": "geri-functional-assessment", "filename": "geriatrics_functional_assessment_caseblocks_50.sql", "title_prefix": "Functional Assessment"},
    "osteoporosis": {"slug": "geri-osteoporosis", "filename": "geriatrics_osteoporosis_caseblocks_50.sql", "title_prefix": "Osteoporosis"},
    "sensory": {"slug": "geri-sensory-changes", "filename": "geriatrics_sensory_changes_caseblocks_50.sql", "title_prefix": "Sensory Changes"},
    "cardiovascular": {"slug": "geri-cardiovascular", "filename": "geriatrics_cardiovascular_caseblocks_50.sql", "title_prefix": "Cardiovascular in Elderly"},
    "end_of_life": {"slug": "geri-end-of-life", "filename": "geriatrics_end_of_life_caseblocks_50.sql", "title_prefix": "End-of-Life Care"},
    "abuse": {"slug": "geri-abuse", "filename": "geriatrics_elder_abuse_caseblocks_50.sql", "title_prefix": "Elder Abuse"},
    "social": {"slug": "geri-social-determinants", "filename": "geriatrics_social_determinants_caseblocks_50.sql", "title_prefix": "Social Determinants"},
}

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her", "pronoun_cap": "She", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "possessive": "his", "pronoun_cap": "He", "possessive_cap": "His"},
]

# Import templates from group files
from geri_templates_group1 import templates_falls, templates_delirium_dementia, templates_polypharmacy, templates_aging_changes
from geri_templates_group2 import templates_pkpd, templates_incontinence, templates_pressure_ulcers, templates_malnutrition
from geri_templates_group3 import templates_cognitive, templates_functional, templates_osteoporosis, templates_sensory
from geri_templates_group4 import templates_cardiovascular, templates_end_of_life, templates_abuse, templates_social

# Map topic keys to template lists
templates = {
    "falls": templates_falls,
    "delirium_dementia": templates_delirium_dementia,
    "polypharmacy": templates_polypharmacy,
    "aging_changes": templates_aging_changes,
    "pkpd": templates_pkpd,
    "incontinence": templates_incontinence,
    "pressure_ulcers": templates_pressure_ulcers,
    "malnutrition": templates_malnutrition,
    "cognitive": templates_cognitive,
    "functional": templates_functional,
    "osteoporosis": templates_osteoporosis,
    "sensory": templates_sensory,
    "cardiovascular": templates_cardiovascular,
    "end_of_life": templates_end_of_life,
    "abuse": templates_abuse,
    "social": templates_social,
}

bp_pool = [
    "118/72", "122/78", "128/82", "132/84", "135/78", "138/82", "140/88",
    "142/90", "148/92", "150/96", "155/98", "158/94", "160/100", "110/68",
    "115/74", "125/80", "130/76", "136/86", "144/94", "152/88"
]

def generate_sql_for_topic(topic_key, config):
    slug = config["slug"]
    filename = config["filename"]
    title_prefix = config["title_prefix"]
    topic_templates = templates[topic_key]
    
    # Ensure we have exactly 10 templates
    assert len(topic_templates) == 10, f"Expected 10 templates for {topic_key}, got {len(topic_templates)}"
    
    cases = []
    
    # 5 variants per template = 50 cases
    for template_idx, template in enumerate(topic_templates):
        for variant in range(5):
            g = genders_pool[variant % 2]
            age_lo, age_hi = template.get("age_range", (65, 95))
            age = random.randint(age_lo, age_hi)
            temp = round(random.uniform(97.8, 99.2), 1)
            hr = random.randint(60, 95)
            bp = random.choice(bp_pool)
            duration = random.randint(2, 18)
            
            eye_side = random.choice(["left", "right"])
            eye_side_abbr = "OS" if eye_side == "left" else "OD"
            
            fmt = {
                "age": age,
                "gender": g["gender"],
                "pronoun": g["pronoun"],
                "pronoun_cap": g["pronoun_cap"],
                "possessive": g["possessive"],
                "possessive_cap": g["possessive_cap"],
                "temp": temp,
                "hr": hr,
                "bp": bp,
                "duration": duration,
                "eye_side": eye_side,
                "eye_side_abbr": eye_side_abbr,
            }
            
            # Render title and scenario with variables
            title_rendered = f"{template['title']} (V{variant + 1})"
            
            try:
                scenario_rendered = template["scenario"].format(**fmt)
            except KeyError as e:
                # If a template uses a custom key not in fmt, just leave it
                scenario_rendered = template["scenario"]
                for k, v in fmt.items():
                    scenario_rendered = scenario_rendered.replace("{" + k + "}", str(v))
            
            # Process questions — shuffle option order
            questions_formatted = []
            for q in template["questions"]:
                opts_orig = q["options"]
                ans_idx = q["answer"]
                
                opts_with_idx = list(enumerate(opts_orig))
                random.shuffle(opts_with_idx)
                
                shuffled_opts = [opt for o_idx, opt in opts_with_idx]
                new_ans_idx = [idx for idx, (o_idx, opt) in enumerate(opts_with_idx) if o_idx == ans_idx][0]
                
                questions_formatted.append({
                    "q": q["q"],
                    "options": shuffled_opts,
                    "answer": new_ans_idx,
                    "exp": q["exp"]
                })
                
            cases.append({
                "title": title_rendered,
                "scenario": scenario_rendered,
                "questions": questions_formatted
            })
        
    # Now write the SQL file!
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\{filename}"
    with open(out_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Geriatrics: {title_prefix}\n")
        f.write("-- US MD/MBBS (4th Year) clinical case blocks\n")
        f.write("-- Target platform: Supabase (Postgres)\n")
        f.write(f"-- Topic Slug: {slug}\n\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\n")
        f.write("DECLARE\n")
        f.write("    v_topic_id UUID;\n")
        f.write("    v_case_id UUID;\n")
        f.write("BEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{slug}' LIMIT 1;\n")
        f.write("    IF v_topic_id IS NULL THEN\n")
        f.write(f"        RAISE EXCEPTION 'Topic slug % not found.', '{slug}';\n")
        f.write("    END IF;\n\n")

        for idx, c in enumerate(cases):
            case_order = idx + 1
            title_escaped = c['title'].replace("'", "''")
            scenario_escaped = c['scenario'].replace("'", "''")
            
            f.write(f"    ---------------------------------------------------------------------------\n")
            f.write(f"    -- CASE {case_order:02d}: {c['title']}\n")
            f.write(f"    ---------------------------------------------------------------------------\n")
            f.write(f"    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '{title_escaped}' LIMIT 1;\n")
            f.write(f"    IF v_case_id IS NULL THEN\n")
            f.write(f"        INSERT INTO case_studies (topic_id, title, scenario, \"order\")\n")
            f.write(f"        VALUES (v_topic_id, '{title_escaped}', '{scenario_escaped}', {case_order}) RETURNING id INTO v_case_id;\n")
            f.write(f"    ELSE\n")
            f.write(f"        UPDATE case_studies SET scenario = '{scenario_escaped}', \"order\" = {case_order} WHERE id = v_case_id;\n")
            f.write(f"    END IF;\n\n")
            
            f.write(f"    DELETE FROM case_questions WHERE case_id = v_case_id;\n")
            f.write(f"    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES\n")
            for q_idx, q in enumerate(c['questions']):
                q_text_escaped = q['q'].replace("'", "''")
                opts_json = json.dumps(q['options'], ensure_ascii=False)
                opts_escaped = opts_json.replace("'", "''")
                exp_escaped = q['exp'].replace("'", "''")
                
                comma = "," if q_idx < len(c['questions']) - 1 else ";"
                f.write(f"    (v_case_id, '{q_text_escaped}', '{opts_escaped}'::jsonb, {q['answer']}, '{exp_escaped}'){comma}\n")
            f.write("\n")
            
        f.write("END $$;\n")
        f.write("COMMIT;\n")
        
    print(f"Successfully generated {filename} with {len(cases)} cases and {len(cases) * 3} questions.")

# Main generation loop
if __name__ == "__main__":
    # Seed random for reproducibility
    random.seed(42)
    
    print("Starting generation of Geriatrics Case Blocks...")
    for topic_key, config in topics_config.items():
        generate_sql_for_topic(topic_key, config)
    print(f"All {len(topics_config)} Geriatrics Case Blocks generated successfully!")
