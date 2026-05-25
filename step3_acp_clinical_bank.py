"""Step 3 Day 2 (ACP) — management, screening, prognosis, systems."""
from build_step3_authentic_banks import build_all

ACP_CASES: list[dict] = []


def load_acp_cases() -> list[dict]:
    global ACP_CASES
    _, ACP_CASES = build_all()
    return ACP_CASES
