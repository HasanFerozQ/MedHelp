#!/usr/bin/env python3
"""Generate USMLE Step 3 mock SQL: 5 mocks × (Day1 240 + Day2 198 MCQs)."""
import json
import random
import re
from pathlib import Path

from step2_ck_mock_clinical_bank import GENDERS
from step3_ck_mock_clinical_bank import CLINICAL_CASES

ROOT = Path(__file__).resolve().parent
MIGRATIONS = ROOT / "supabase" / "migrations"
AGES = list(range(22, 84))

DAY1_BUCKETS = {
    1: {"internal_medicine": 120, "obgyn": 24, "pediatrics": 36, "emergency": 24, "surgery": 24, "ethics": 12},
    2: {"internal_medicine": 96, "obgyn": 48, "pediatrics": 48, "emergency": 12, "surgery": 12, "ethics": 24},
    3: {"internal_medicine": 84, "obgyn": 12, "pediatrics": 24, "emergency": 48, "surgery": 48, "ethics": 24},
    4: {"internal_medicine": 72, "obgyn": 12, "pediatrics": 12, "emergency": 12, "surgery": 12, "ortho": 48, "ophtho": 24, "ent": 24, "dermatology": 24},
    5: {"internal_medicine": 60, "obgyn": 12, "pediatrics": 12, "emergency": 12, "surgery": 12, "ethics": 48, "geriatrics": 48, "preventive": 48},
}

DAY2_BUCKETS = {
    1: {"internal_medicine": 80, "obgyn": 20, "pediatrics": 20, "emergency": 30, "surgery": 28, "ethics": 20},
    2: {"internal_medicine": 60, "obgyn": 40, "pediatrics": 40, "emergency": 18, "surgery": 20, "ethics": 20},
    3: {"internal_medicine": 50, "obgyn": 10, "pediatrics": 18, "emergency": 50, "surgery": 50, "ethics": 20},
    4: {"internal_medicine": 40, "obgyn": 10, "pediatrics": 10, "emergency": 10, "surgery": 10, "ortho": 40, "ophtho": 30, "ent": 28, "dermatology": 20},
    5: {"internal_medicine": 40, "obgyn": 10, "pediatrics": 10, "emergency": 10, "surgery": 10, "ethics": 40, "geriatrics": 40, "preventive": 38},
}


def sql_escape(s: str) -> str:
    return s.replace("'", "''")


def build_stem(case, age, gender_word, poss, cap):
    intro = case["intro"]
    if "{poss}" in intro or "{cap}" in intro:
        intro = intro.format(poss=poss, cap=cap)
    opening = f"A {age}-year-old {gender_word} {intro}".strip()
    opening = re.sub(r"\s+", " ", opening)
    return (
        f"{opening}\n\nPhysical Examination:\n\n{case['pe']}\n\n"
        f"Laboratory Results:\n\n{case['labs']}\n\n\n{case['question']}"
    )


def make_mcq(case, seed):
    rng = random.Random(seed)
    age = rng.choice(AGES)
    gender_word, poss, cap, _ = rng.choice(GENDERS)
    stem = build_stem(case, age, gender_word, poss, cap)
    opts = list(case["options"])
    correct = opts[case["answer"]]
    rng.shuffle(opts)
    return {
        "question": stem,
        "options": opts,
        "correct_index": opts.index(correct),
        "explanation": case["exp"],
    }


def by_subject():
    out = {}
    for c in CLINICAL_CASES:
        subj = c["subject"]
        if subj in ("ortho", "ophtho", "ent") and subj not in out:
            out[subj] = []
        if subj == "neonatal":
            out.setdefault("pediatrics", []).append(c)
        out.setdefault(subj, []).append(c)
    return out


def pick_mcqs(buckets, mock_num, offset=0):
    pool = by_subject()
    mcqs = []
    seed = 20260524 + mock_num * 1000 + offset
    for subject, count in buckets.items():
        cases = pool.get(subject) or pool.get("internal_medicine", [])
        for i in range(count):
            case = cases[(i + mock_num * 11 + offset) % len(cases)]
            mcqs.append(make_mcq(case, seed))
            seed += 1
    random.Random(mock_num + offset).shuffle(mcqs)
    return mcqs


def write_topics():
    path = MIGRATIONS / "20260524_step3_ck_mock_topics.sql"
    lines = [
        "-- USMLE Step 3 hidden mock pools (Day 1 FIP + Day 2 ACP per mock)",
        "BEGIN;",
        "DO $$",
        "DECLARE v_max INT;",
        "BEGIN",
        '  SELECT COALESCE(MAX("order"), 0) INTO v_max FROM topics WHERE usmle_step = 3;',
    ]
    for n in range(1, 6):
        for day, label in [("day1-fip", "Day 1 FIP"), ("day2-acp", "Day 2 ACP")]:
            slug = f"usmle-3-mock-pool-mock{n}-{day}"
            title = f"USMLE Step 3 Mock #{n} — {label}"
            lines.append(f"  IF NOT EXISTS (SELECT 1 FROM topics WHERE slug = '{slug}') THEN")
            lines.append(
                f"    INSERT INTO topics (title, slug, section, usmle_step, \"order\") "
                f"VALUES ('{title}', '{slug}', 'Mock Exams', 3, v_max + {n * 2 + (0 if day.startswith('day1') else 1)});"
            )
            lines.append("  END IF;")
    lines += ["END $$;", "COMMIT;"]
    path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {path}")


def write_sql(mock_num, day_suffix, mcqs, total_expected):
    slug = f"usmle-3-mock-pool-mock{mock_num}-{day_suffix}"
    path = MIGRATIONS / f"20260524_step3_ck_mock{mock_num}_{day_suffix}.sql"
    if len(mcqs) != total_expected:
        raise SystemExit(f"mock{mock_num} {day_suffix}: got {len(mcqs)}, need {total_expected}")
    vals = []
    for m in mcqs:
        q = sql_escape(m["question"])
        o = sql_escape(json.dumps(m["options"]))
        e = sql_escape(m["explanation"])
        vals.append(f"    (v_topic_id, '{q}', '{o}'::jsonb, {m['correct_index']}, '{e}')")
    body = (
        f"-- Step 3 Mock #{mock_num} {day_suffix} — {len(mcqs)} MCQs\nBEGIN;\nDO $$\n"
        f"DECLARE v_topic_id UUID;\nBEGIN\n"
        f"  SELECT id INTO v_topic_id FROM topics WHERE slug = '{slug}' LIMIT 1;\n"
        f"  IF v_topic_id IS NULL THEN RAISE EXCEPTION 'Topic {slug} missing';\n"
        f"  END IF;\n  DELETE FROM mcqs WHERE topic_id = v_topic_id;\n"
        f"  INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n"
        + ",\n".join(vals)
        + ";\nEND $$;\nCOMMIT;\n"
    )
    path.write_text(body, encoding="utf-8")
    print(f"Wrote {path} ({len(mcqs)})")


def main():
    write_topics()
    for n in range(1, 6):
        d1 = pick_mcqs(DAY1_BUCKETS[n], n, 0)[:240]
        d2 = pick_mcqs(DAY2_BUCKETS[n], n, 500)[:198]
        write_sql(n, "day1-fip", d1, 240)
        write_sql(n, "day2-acp", d2, 198)
    print("Done.")


if __name__ == "__main__":
    main()
