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

# ── CMS Direct Download URLs (Modernized for FY2025/2026) ─────────────────────
# CMS URLs are notoriously flaky. We use the most stable patterns available.

CMS_SOURCES = [
    {
        "name"   : "MPFS (Physician Fee Schedule RVU — CY2026 RVU26A)",
        "url"    : "https://www.cms.gov/files/zip/rvu26a.zip",
        "zip"    : "mpfs_rvu.zip",
        "is_zip" : True,
        "extract": "PPRRVU26_JAN.csv",
        "dest"   : "mpfs.csv",
        "note"   : "~10,000 CPT/HCPCS codes with Work/PE/MP RVUs (Latest 2026)"
    },
    {
        "name"   : "NCCI PTP Edits (Physician - Q1 2026 Part 1)",
        "url"    : "https://www.cms.gov/files/zip/medicare-ncci-2026q1-practitioner-ptp-edits-ccipra-v320r0-f1.zip",
        "zip"    : "ncci_ptp.zip",
        "is_zip" : True,
        "extract": None,
        "dest"   : "ncci_ptp.csv",
        "note"   : "~230,000 Column1/Column2 bundling pairs (Part 1)"
    },
    {
        "name"   : "MUE (Medically Unlikely Edits — Physician - Q1 2026)",
        "url"    : "https://www.cms.gov/files/zip/medicare-ncci-2026-q1-practitioner-services-mue-table.zip",
        "zip"    : "mue.zip",
        "is_zip" : True,
        "extract": None,
        "dest"   : "mue.csv",
        "note"   : "~8,000 per-code daily unit limits"
    },
    {
        "name"   : "ICD-10-CM (Diagnosis Codes — FY2026 Fallback)",
        "url"    : "https://raw.githubusercontent.com/k4m1113/ICD-10-CSV/master/codes.csv",
        "zip"    : "icd10cm.csv",
        "is_zip" : False,
        "extract": None,
        "dest"   : "icd10cm.csv",
        "note"   : "Standard ICD-10 core (~15k codes) — used for stability."
    },
    {
        "name"   : "ICD-10-PCS (Procedure Codes — FY2026 Final)",
        "url"    : "https://www.cms.gov/files/zip/2026-icd-10-pcs-order-files.zip",
        "zip"    : "icd10pcs.zip",
        "is_zip" : True,
        "extract": "icd10pcs_order_2026.txt",
        "dest"   : "icd10pcs.txt",
        "note"   : "~80,000 Inpatient Hospital Procedure codes"
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

def find_data_file_in_zip(zf):
    """Return the LARGEST CSV or TXT file name inside the ZIP (discriminates against readmes)."""
    candidates = []
    for info in zf.infolist():
        name = info.filename
        if (name.lower().endswith('.csv') or name.lower().endswith('.txt')) and not name.startswith('__'):
            candidates.append(info)
    
    if not candidates:
        return None
        
    # Sort by file size descending
    candidates.sort(key=lambda x: x.file_size, reverse=True)
    return candidates[0].filename

def download_source(src):
    zip_path  = os.path.join(DATA_DIR, src["zip"])
    dest_path = os.path.join(DATA_DIR, src["dest"])

    if os.path.exists(dest_path):
        size_bytes = os.path.getsize(dest_path)
        if size_bytes > 51200: # 50KB Minimum for a real CMS dataset
            print(f"  ✅ Already exists ({size_bytes/1024/1024:.1f} MB) — skipping download. Delete to re-download.")
            return True
        else:
            print(f"  ⚠️ Existing file is too small ({size_bytes} bytes) — likely a failed previous extraction. Re-downloading...")

    print(f"  Downloading from internal sources...")
    try:
        # CMS often blocks default Python User-Agents.
        opener = urllib.request.build_opener()
        opener.addheaders = [('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36')]
        urllib.request.install_opener(opener)
        
        urllib.request.urlretrieve(src["url"], zip_path, reporthook)
    except Exception as e:
        print(f"  ❌ Download failed: {e}")
        print(f"     Manual URL: {src['url']}")
        return False

    if not src.get("is_zip", True):
        # Direct file download (not a ZIP)
        if zip_path != dest_path:
            if os.path.exists(dest_path):
                os.remove(dest_path)
            os.rename(zip_path, dest_path)
        print(f"  ✅ Ready: {dest_path}")
        return True

    print(f"  Extracting ZIP...")
    try:
        with zipfile.ZipFile(zip_path, 'r') as zf:
            data_file_name = src["extract"] or find_data_file_in_zip(zf)
            if not data_file_name:
                print(f"  ❌ No CSV or TXT found in ZIP. Contents: {zf.namelist()}")
                return False
            # Try exact name first, then case-insensitive search
            try:
                zf.extract(data_file_name, DATA_DIR)
                extracted = os.path.join(DATA_DIR, data_file_name)
            except KeyError:
                # Case-insensitive match
                match = next((n for n in zf.namelist() if n.lower() == data_file_name.lower()), None)
                if not match:
                    match = find_data_file_in_zip(zf)
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
