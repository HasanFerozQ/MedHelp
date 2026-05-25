#!/usr/bin/env python3
"""
Generate USMLE Step 3 mock SQL with authentic split:
  Day 1 FIP — diagnosis, initial workup, mechanism, biostat/ethics
  Day 2 ACP — management, chronic care, screening, prognosis (separate bank)
"""
import json
import random
from collections import defaultdict
from pathlib import Path

from build_step3_authentic_banks import build_all
from step3_authentic_common import make_mcq

ROOT = Path(__file__).resolve().parent
MIGRATIONS = ROOT / "supabase" / "migrations"

# NBME-style FIP day distribution (240 total)
FIP_QUOTAS = {
    "diagnosis": 96,
    "diagnostic_study": 60,
    "pathophys_mechanism": 36,
    "biostat": 24,
    "ethics_communication": 24,
}

# NBME-style ACP day distribution (198 total)
ACP_QUOTAS = {
    "acute_management": 60,
    "chronic_management": 50,
    "screening_prevention": 40,
    "prognosis_complications": 38,
    "systems_medicolegal": 10,
}


def sql_escape(s: str) -> str:
    return s.replace("'", "''")


def expand_pool(cases: list[dict], min_size: int) -> list[dict]:
    """Clone cases with variant ids so each mock can draw unique templates."""
    if len(cases) >= min_size:
        return list(cases)
    expanded = []
    v = 0
    while len(expanded) < min_size:
        for c in cases:
            nc = dict(c)
            nc["id"] = f"{c['id']}-x{v // max(len(cases), 1)}"
            expanded.append(nc)
            if len(expanded) >= min_size:
                break
        v += 1
    return expanded


def pick_by_quotas(pool: list[dict], quotas: dict[str, int], mock_num: int, salt: int) -> list[dict]:
    rng = random.Random(20260530 + mock_num * 10007 + salt)
    by_cat: dict[str, list[dict]] = defaultdict(list)
    for c in pool:
        by_cat[c["category"]].append(c)

    selected: list[dict] = []
    for cat, need in quotas.items():
        cases = by_cat.get(cat, [])
        if not cases:
            raise SystemExit(f"No cases for category {cat}")
        cases = list(cases)
        rng.shuffle(cases)
        start = ((mock_num - 1) * need) % len(cases)
        ordered = cases[start:] + cases[:start]
        for i in range(need):
            selected.append(ordered[i % len(ordered)])

    rng.shuffle(selected)
    return selected


def build_mcqs(cases: list[dict], mock_num: int, salt: int) -> list[dict]:
    seed = 20260524 + mock_num * 5000 + salt
    out = []
    for i, case in enumerate(cases):
        mcq = make_mcq(case, seed + i)
        out.append(mcq)
    return out


def write_topics():
    path = MIGRATIONS / "20260524_step3_ck_mock_topics.sql"
    lines = [
        "-- USMLE Step 3 hidden mock pools (authentic FIP Day 1 + ACP Day 2)",
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
        f"-- Step 3 Mock #{mock_num} {day_suffix} — {len(mcqs)} authentic MCQs\nBEGIN;\nDO $$\n"
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
    fip_pool, acp_pool = build_all()
    print(f"Bank: {len(fip_pool)} FIP, {len(acp_pool)} ACP templates")

    fip_pool = expand_pool(fip_pool, 260)
    acp_pool = expand_pool(acp_pool, 210)

    write_topics()
    for n in range(1, 6):
        fip_cases = pick_by_quotas(fip_pool, FIP_QUOTAS, n, 0)
        acp_cases = pick_by_quotas(acp_pool, ACP_QUOTAS, n, 900)
        d1 = build_mcqs(fip_cases, n, 0)
        d2 = build_mcqs(acp_cases, n, 900)
        write_sql(n, "day1-fip", d1, 240)
        write_sql(n, "day2-acp", d2, 198)
    print("Done — Step 3 authentic FIP/ACP mocks generated.")


if __name__ == "__main__":
    main()
