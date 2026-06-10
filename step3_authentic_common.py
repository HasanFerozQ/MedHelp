"""Shared helpers for Step 3 authentic FIP / ACP vignette banks."""
import re

GENDERS = [
    ("male", "his", "he", "man"),
    ("female", "her", "she", "woman"),
]


def build_stem(case: dict, age: int, gender_word: str, poss: str, cap: str) -> str:
    intro = case["intro"]
    if "{poss}" in intro or "{cap}" in intro:
        intro = intro.format(poss=poss, cap=cap)
    elif intro and intro[0].islower():
        intro = intro
    else:
        intro = intro[0].lower() + intro[1:] if intro else intro
    opening = f"A {age}-year-old {gender_word} {intro}".strip()
    opening = re.sub(r"\s+", " ", opening)

    # Format PE: add blank lines between subsections for clarity
    pe_raw = case["pe"]
    pe_formatted = "\n\n".join(line.strip() for line in pe_raw.split("\n") if line.strip())

    # Format Labs: add blank lines between findings for clarity
    labs_raw = case["labs"]
    labs_formatted = "\n\n".join(line.strip() for line in labs_raw.split("\n") if line.strip())

    return (
        f"{opening}\n\n"
        f"Physical Examination:\n\n"
        f"{pe_formatted}\n\n"
        f"Laboratory Results:\n\n"
        f"{labs_formatted}\n\n\n"
        f"{case['question']}"
    )


def make_mcq(case: dict, variant_seed: int) -> dict:
    import random

    rng = random.Random(variant_seed)
    age = rng.randint(22, 84)
    gender_word, poss, cap, _ = rng.choice(GENDERS)
    stem = build_stem(case, age, gender_word, poss, cap)
    opts = list(case["options"])
    correct = opts[case["answer"]]
    rng.shuffle(opts)
    return {
        "id": case.get("id", ""),
        "category": case.get("category", ""),
        "question": stem,
        "options": opts,
        "correct_index": opts.index(correct),
        "explanation": case["exp"],
    }
