#!/usr/bin/env python3
"""
Generate USMLE Step 2 CK full-length mock exam SQL migrations (5 mocks × 320 MCQs).
Run: python generate_step2_ck_mock_exams.py
"""
import json
import random
import re
from pathlib import Path

from step2_ck_mock_clinical_bank import CLINICAL_CASES, GENDERS

ROOT = Path(__file__).resolve().parent
MIGRATIONS = ROOT / "supabase" / "migrations"
QUESTIONS_PER_MOCK = 320

MOCK_BUCKETS = {
    1: {"internal_medicine": 176, "surgery": 72, "pediatrics": 32, "obgyn": 24, "psychiatry": 16, "preventive": 0},
    2: {"internal_medicine": 208, "surgery": 56, "pediatrics": 24, "obgyn": 20, "psychiatry": 12, "preventive": 0},
    3: {"internal_medicine": 128, "surgery": 96, "pediatrics": 32, "obgyn": 32, "psychiatry": 32, "preventive": 0},
    4: {"internal_medicine": 144, "surgery": 64, "pediatrics": 64, "obgyn": 40, "psychiatry": 8, "preventive": 0},
    5: {"internal_medicine": 128, "surgery": 48, "pediatrics": 40, "obgyn": 40, "psychiatry": 48, "preventive": 16},
}

TOPIC_SLUGS = {
    1: "usmle-2-mock-pool-mock1",
    2: "usmle-2-mock-pool-mock2",
    3: "usmle-2-mock-pool-mock3",
    4: "usmle-2-mock-pool-mock4",
    5: "usmle-2-mock-pool-mock5",
}

AGES = list(range(22, 84))


def sql_escape(s: str) -> str:
    return s.replace("'", "''")


def build_stem(case: dict, age: int, gender_word: str, poss: str, cap: str) -> str:
    intro = case["intro"]
    if "{poss}" in intro or "{cap}" in intro:
        intro = intro.format(poss=poss, cap=cap)
    elif intro.startswith("is ") or intro.startswith("at ") or intro.startswith("presents") or intro.startswith("has ") or intro.startswith("was ") or intro.startswith("on ") or intro.startswith("with ") or intro.startswith("developed") or intro.startswith("reports"):
        intro = intro
    else:
        intro = intro[0].lower() + intro[1:] if intro else intro

    opening = f"A {age}-year-old {gender_word} {intro}".strip()
    opening = re.sub(r"\s+", " ", opening)
    return (
        f"{opening}\n\n"
        f"Physical Examination:\n\n"
        f"{case['pe']}\n\n"
        f"Laboratory Results:\n\n"
        f"{case['labs']}\n\n\n"
        f"{case['question']}"
    )


def make_mcq(case: dict, variant_seed: int) -> dict:
    rng = random.Random(variant_seed)
    age = rng.choice(AGES)
    gender_word, poss, cap, _ = rng.choice(GENDERS)
    stem = build_stem(case, age, gender_word, poss, cap)

    opts = list(case["options"])
    correct = opts[case["answer"]]
    rng.shuffle(opts)
    new_idx = opts.index(correct)

    return {
        "question": stem,
        "options": opts,
        "correct_index": new_idx,
        "explanation": case["exp"],
    }


def cases_by_subject() -> dict:
    out = {}
    for c in CLINICAL_CASES:
        out.setdefault(c["subject"], []).append(c)
    return out


def pick_mcqs_for_mock(mock_num: int, by_subject: dict) -> list:
    buckets = MOCK_BUCKETS[mock_num]
    rng = random.Random(20260523 + mock_num)
    mcqs = []
    global_variant = mock_num * 10000

    for subject, count in buckets.items():
        pool = by_subject.get(subject, [])
        if not pool:
            pool = by_subject.get("internal_medicine", [])
        if count <= 0:
            continue
        for i in range(count):
            case = pool[(i + mock_num * 17) % len(pool)]
            mcq = make_mcq(case, global_variant + i + subject.__hash__())
            mcqs.append(mcq)
            global_variant += 1

    rng.shuffle(mcqs)
    return mcqs[:QUESTIONS_PER_MOCK]


def write_topics_migration():
    path = MIGRATIONS / "20260523_step2_ck_mock_topics.sql"
    lines = [
        "-- Hidden Step 2 CK full-length mock exam question pools (not shown in USMLE topic browser)",
        "BEGIN;",
        "",
        "DO $$",
        "DECLARE",
        "    v_max_order INT;",
        "BEGIN",
        '    SELECT COALESCE(MAX("order"), 0) INTO v_max_order FROM topics WHERE usmle_step = 2;',
        "",
    ]
    titles = {
        1: "USMLE Step 2 CK Mock #1 — Full-Length Pool",
        2: "USMLE Step 2 CK Mock #2 — Internal Medicine Emphasis",
        3: "USMLE Step 2 CK Mock #3 — Surgery & Acute Care",
        4: "USMLE Step 2 CK Mock #4 — Pediatrics & OB/GYN",
        5: "USMLE Step 2 CK Mock #5 — Psychiatry, Ethics & Multispecialty",
    }
    for n in range(1, 6):
        slug = TOPIC_SLUGS[n]
        title = titles[n]
        lines.append(f"    IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = '{slug}') THEN")
        lines.append(f"        INSERT INTO topics (title, slug, section, usmle_step, \"order\")")
        lines.append(f"        VALUES ('{title}', '{slug}', 'Mock Exams', 2, v_max_order + {n});")
        lines.append("    END IF;")
        lines.append("")
    lines.append("END $$;")
    lines.append("COMMIT;")
    path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {path}")


def write_mock_migration(mock_num: int, mcqs: list):
    slug = TOPIC_SLUGS[mock_num]
    path = MIGRATIONS / f"20260523_step2_ck_mock{mock_num}_mcqs.sql"
    values = []
    for m in mcqs:
        q = sql_escape(m["question"])
        opts = sql_escape(json.dumps(m["options"]))
        exp = sql_escape(m["explanation"])
        values.append(
            f"    (v_topic_id, '{q}', '{opts}'::jsonb, {m['correct_index']}, '{exp}')"
        )

    content = f"""-- USMLE Step 2 CK Mock #{mock_num} — {len(mcqs)} clinical vignette MCQs
BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = '{slug}' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic {slug} not found. Run 20260523_step2_ck_mock_topics.sql first.';
    END IF;

    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
"""
    content += ",\n".join(values) + ";\n"
    content += """
END $$;
COMMIT;
"""
    path.write_text(content, encoding="utf-8")
    print(f"Wrote {path} ({len(mcqs)} MCQs)")


def main():
    random.seed(42)
    by_subject = cases_by_subject()
    print("Cases per subject:", {k: len(v) for k, v in by_subject.items()})

    write_topics_migration()
    for mock_num in range(1, 6):
        mcqs = pick_mcqs_for_mock(mock_num, by_subject)
        if len(mcqs) != QUESTIONS_PER_MOCK:
            raise SystemExit(f"Mock {mock_num}: expected {QUESTIONS_PER_MOCK}, got {len(mcqs)}")
        write_mock_migration(mock_num, mcqs)

    print("Done. Apply migrations to Supabase, then use mock exams from the lobby.")


if __name__ == "__main__":
    main()
