#!/usr/bin/env python3
"""
MediHelp — CMS Data Downloader (v1.0)
======================================
Downloads all three CMS datasets needed for full audit accuracy:
  1. MPFS  — Medicare Physician Fee Schedule (RVU file, ~10,000 CPT codes + prices)
  2. NCCI  — National Correct Coding Initiative PTP Edits (~230,000 bundling pairs)
  3. MUE   — Medically Unlikely Edits (~8,000 per-code daily limits)

Run this ONCE to download the raw files, then run the three seed_*.py scripts to load them.

Usage:
  cd c:\\Users\\Hasan-Pc\\Desktop\\MedHelp
  python scripts/data_ingestion/download_cms_data.py

Output files (created automatically):
  scripts/data_ingestion/data/mpfs.csv
  scripts/data_ingestion/data/ncci_ptp.csv
  scripts/data_ingestion/data/mue.csv
"""

import os
import sys
import zipfile
import urllib.request

# ── Output directory ──────────────────────────────────────────────────────────
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR   = os.path.join(SCRIPT_DIR, "data")
os.makedirs(DATA_DIR, exist_ok=True)

# ── CMS Direct Download URLs (updated for CY2024 / Q1 releases) ──────────────
# These are stable CMS.gov URLs — update the year suffix annually.

CMS_SOURCES = [
    {
        "name"   : "MPFS (Physician Fee Schedule RVU)",
        "url"    : "https://www.cms.gov/files/zip/cy2024-january-physician-fee-schedule-pfs-relative-value-files.zip",
        "zip"    : "mpfs_rvu.zip",
        "extract": "PPRRVU24_JAN.csv",   # typical filename inside the ZIP
        "dest"   : "mpfs.csv",
        "note"   : "~10,000 CPT/HCPCS codes with Work/PE/MP RVUs"
    },
    {
        "name"   : "NCCI PTP Edits (Physician)",
        "url"    : "https://www.cms.gov/files/zip/ncci-medicare-physician-medically-unlikely-edits.zip",
        "zip"    : "ncci_ptp.zip",
        "extract": None,                 # We'll find the CSV inside
        "dest"   : "ncci_ptp.csv",
        "note"   : "~230,000 Column1/Column2 bundling pairs"
    },
    {
        "name"   : "MUE (Medically Unlikely Edits — Physician)",
        "url"    : "https://www.cms.gov/files/zip/january-2024-physician-mue.zip",
        "zip"    : "mue.zip",
        "extract": None,
        "dest"   : "mue.csv",
        "note"   : "~8,000 per-code daily unit limits"
    },
]

def reporthook(block_num, block_size, total_size):
    downloaded = block_num * block_size
    if total_size > 0:
        pct = min(100, downloaded * 100 // total_size)
        mb  = downloaded / (1024 * 1024)
        sys.stdout.write(f"\r  Downloading... {pct}% ({mb:.1f} MB)")
        sys.stdout.flush()
    if downloaded >= total_size:
        print()

def find_csv_in_zip(zf):
    """Return the first CSV file name inside the ZIP."""
    for name in zf.namelist():
        if name.lower().endswith('.csv') and not name.startswith('__'):
            return name
    return None

def download_source(src):
    zip_path  = os.path.join(DATA_DIR, src["zip"])
    dest_path = os.path.join(DATA_DIR, src["dest"])

    if os.path.exists(dest_path):
        size_mb = os.path.getsize(dest_path) / (1024 * 1024)
        print(f"  ✅ Already exists ({size_mb:.1f} MB) — skipping download. Delete to re-download.")
        return True

    print(f"  Downloading from CMS.gov...")
    try:
        urllib.request.urlretrieve(src["url"], zip_path, reporthook)
    except Exception as e:
        print(f"  ❌ Download failed: {e}")
        print(f"     Manual URL: {src['url']}")
        return False

    print(f"  Extracting ZIP...")
    try:
        with zipfile.ZipFile(zip_path, 'r') as zf:
            csv_name = src["extract"] or find_csv_in_zip(zf)
            if not csv_name:
                print(f"  ❌ No CSV found in ZIP. Contents: {zf.namelist()}")
                return False
            # Try exact name first, then case-insensitive search
            try:
                zf.extract(csv_name, DATA_DIR)
                extracted = os.path.join(DATA_DIR, csv_name)
            except KeyError:
                # Case-insensitive match
                match = next((n for n in zf.namelist() if n.lower() == csv_name.lower()), None)
                if not match:
                    match = find_csv_in_zip(zf)
                zf.extract(match, DATA_DIR)
                extracted = os.path.join(DATA_DIR, match)

            # Rename to dest filename
            if extracted != dest_path:
                if os.path.exists(dest_path):
                    os.remove(dest_path)
                os.rename(extracted, dest_path)
    except Exception as e:
        print(f"  ❌ Extraction failed: {e}")
        return False

    # Clean up ZIP
    os.remove(zip_path)
    size_mb = os.path.getsize(dest_path) / (1024 * 1024)
    print(f"  ✅ Ready: {dest_path} ({size_mb:.1f} MB)")
    return True

def main():
    print("=" * 60)
    print("MediHelp — CMS Data Downloader")
    print("=" * 60)
    print(f"Output directory: {DATA_DIR}\n")

    results = {}
    for src in CMS_SOURCES:
        print(f"📥 {src['name']}")
        print(f"   {src['note']}")
        ok = download_source(src)
        results[src["name"]] = ok
        print()

    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)
    all_ok = True
    for name, ok in results.items():
        status = "✅" if ok else "❌"
        print(f"  {status} {name}")
        if not ok:
            all_ok = False

    if all_ok:
        print("\n✅ All files ready. Run the seed scripts in this order:")
        print("   python scripts/data_ingestion/seed_mpfs.py")
        print("   python scripts/data_ingestion/seed_ncci.py")
        print("   python scripts/data_ingestion/seed_mue.py")
    else:
        print("\n⚠️  Some downloads failed. CMS URLs change annually — check cms.gov for the latest.")
        print("   Fallback: download the ZIP manually, extract the CSV, rename to the dest filename above.")
        print("\n   MPFS:  https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeeSched")
        print("   NCCI:  https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/NCCI-Policy-Manual")
        print("   MUE:   https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/MUE")

if __name__ == "__main__":
    main()
