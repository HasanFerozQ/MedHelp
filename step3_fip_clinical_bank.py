"""Step 3 Day 1 (FIP) — diagnosis, workup, mechanism, biostat/ethics."""
from build_step3_authentic_banks import build_all

FIP_CASES: list[dict] = []


def load_fip_cases() -> list[dict]:
    global FIP_CASES
    FIP_CASES, _ = build_all()
    return FIP_CASES
