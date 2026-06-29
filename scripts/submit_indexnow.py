# -*- coding: utf-8 -*-
"""
IndexNow Bulk Submission Script - medihelp.live
===============================================
Reads all URLs from sitemap.xml and submits them to the IndexNow API
(api.indexnow.org) which notifies Bing, Yandex, and other engines.

Usage:
    python scripts/submit_indexnow.py

Requirements:
    pip install requests
"""

import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

try:
    import requests
except ImportError:
    print("[ERROR] 'requests' is not installed. Run: pip install requests")
    sys.exit(1)

# ─── Configuration ────────────────────────────────────────────────────────────
API_KEY      = "3b37111040354dcfb9e7f84573966434"
HOST         = "www.medihelp.live"
KEY_LOCATION = f"https://{HOST}/{API_KEY}.txt"
ENDPOINT     = "https://api.indexnow.org/indexnow"
BATCH_SIZE   = 100          # Max URLs per request (IndexNow supports up to 10,000)
SITEMAP_PATH = Path(__file__).parent.parent / "sitemap.xml"
# ─────────────────────────────────────────────────────────────────────────────


def parse_sitemap(path: Path) -> list[str]:
    """Extract all <loc> URLs from a sitemap.xml file."""
    tree = ET.parse(path)
    root = tree.getroot()
    # Handle namespace
    ns = {"sm": "http://www.sitemaps.org/schemas/sitemap/0.9"}
    urls = [loc.text.strip() for loc in root.findall(".//sm:loc", ns) if loc.text]
    return urls


def submit_batch(urls: list[str], batch_num: int, total_batches: int) -> bool:
    """Submit a batch of URLs to IndexNow. Returns True on success."""
    payload = {
        "host": HOST,
        "key": API_KEY,
        "keyLocation": KEY_LOCATION,
        "urlList": urls,
    }
    headers = {"Content-Type": "application/json; charset=utf-8"}

    print(f"\n  [>>] Batch {batch_num}/{total_batches} - {len(urls)} URL(s)")

    try:
        response = requests.post(
            ENDPOINT,
            data=json.dumps(payload, ensure_ascii=False).encode("utf-8"),
            headers=headers,
            timeout=30,
        )

        status = response.status_code
        if status == 200:
            print(f"  [OK] Success (HTTP {status})")
            return True
        elif status == 202:
            print(f"  [OK] Accepted (HTTP {status}) - URLs queued for processing")
            return True
        elif status == 400:
            print(f"  [ERR] Bad Request (HTTP {status}) - check URL format")
        elif status == 403:
            print(f"  [ERR] Forbidden (HTTP {status}) - key file not found at {KEY_LOCATION}")
            print("        Make sure you've deployed first!")
        elif status == 422:
            print(f"  [ERR] Unprocessable (HTTP {status}) - URLs don't match host")
        elif status == 429:
            print(f"  [!]  Rate limited (HTTP {status}) - too many requests, slow down")
        else:
            print(f"  [!]  Unexpected status (HTTP {status}): {response.text[:200]}")

        return False

    except requests.exceptions.ConnectionError:
        print("  [ERR] Connection error - check your internet connection")
        return False
    except requests.exceptions.Timeout:
        print("  [ERR] Request timed out")
        return False
    except Exception as e:
        print(f"  [ERR] Unexpected error: {e}")
        return False


def main():
    print("=" * 60)
    print("  IndexNow Bulk Submission — medihelp.live")
    print("=" * 60)
    print(f"  Key:      {API_KEY}")
    print(f"  Endpoint: {ENDPOINT}")
    print(f"  Sitemap:  {SITEMAP_PATH}")

    # Parse sitemap
    if not SITEMAP_PATH.exists():
        print(f"\n[ERROR] Sitemap not found at: {SITEMAP_PATH}")
        sys.exit(1)

    urls = parse_sitemap(SITEMAP_PATH)
    total_urls = len(urls)
    print(f"\n  Found {total_urls} URLs in sitemap")
    print()

    if total_urls == 0:
        print("[ERROR] No URLs found in sitemap.")
        sys.exit(1)

    # Split into batches
    batches = [urls[i:i + BATCH_SIZE] for i in range(0, total_urls, BATCH_SIZE)]
    total_batches = len(batches)
    print(f"  Submitting in {total_batches} batch(es) of up to {BATCH_SIZE} URLs each...")

    # Submit each batch
    success_count = 0
    fail_count = 0

    for i, batch in enumerate(batches, start=1):
        ok = submit_batch(batch, i, total_batches)
        if ok:
            success_count += len(batch)
        else:
            fail_count += len(batch)

    # Summary
    print("\n" + "=" * 60)
    print("  SUMMARY")
    print("=" * 60)
    print(f"  [OK]  Successfully submitted: {success_count} URL(s)")
    if fail_count:
        print(f"  [ERR] Failed:                {fail_count} URL(s)")
    print()

    if success_count > 0:
        print("  Done! Bing (and other engines) will crawl your pages soon.")
        print("  Check indexing status at: https://www.bing.com/webmasters/")
    else:
        print("  All submissions failed.")
        print("  Make sure your key file is live at:")
        print(f"  {KEY_LOCATION}")


if __name__ == "__main__":
    main()
