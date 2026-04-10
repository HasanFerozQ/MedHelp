# MediHelp — CMS Data Ingestion Guide

This directory contains scripts to load **full CMS clinical datasets** into Supabase,
taking the audit engine from ~92% to 100% accuracy.

## What Gets Loaded

| Dataset | Records | Current | After Ingestion |
|---------|---------|---------|-----------------|
| MPFS Physician Fee Schedule | ~10,000 CPT codes + prices | 43 inline | **Full CMS** |
| NCCI PTP Bundling Edits | ~230,000 code pairs | 6 inline | **Full CMS** |
| MUE Daily Unit Limits | ~8,000 codes | 28 inline | **Full CMS** |
| ICD-10-CM Diagnosis Codes | ~95,000 diagnosis codes | 0 | **Full CMS** |
| ICD-10-PCS Procedure Codes | ~80,000 procedure codes | 0 | **Full CMS** |

## Prerequisites

```bash
pip install requests
```

Your `.env` file at the project root must contain:
```
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

## Step 1 — Run the SQL migration in Supabase

Open the **Supabase Dashboard → SQL Editor** and run:
```
database_update_v4_mue.sql
```
This creates the `mue_limits` table (the other tables already exist from v3).

## Step 2 — Download CMS data files

```bash
cd c:\Users\Hasan-Pc\Desktop\MedHelp
python scripts/data_ingestion/download_cms_data.py
```

This downloads ~3 ZIP files from CMS.gov and extracts the CSVs into
`scripts/data_ingestion/data/`. Takes ~2-5 minutes depending on connection.

> **If the download fails**: CMS updates their download URLs annually. Visit each
> URL below, download the ZIP manually, extract the CSV, and rename it:
> - MPFS → `scripts/data_ingestion/data/mpfs.csv`
>   https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeeSched
> - NCCI → `scripts/data_ingestion/data/ncci_ptp.csv`
>   https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/NCCI-Policy-Manual
> - MUE  → `scripts/data_ingestion/data/mue.csv`
>   https://www.cms.gov/Medicare/Coding/NationalCorrectCodInitEd/MUE

## Step 3 — Seed the databases

Run all three scripts from the project root. Each takes 2–10 minutes.

```bash
# Physician Fee Schedule (~10,000 rows, 1-2 min)
python scripts/data_ingestion/seed_mpfs.py

# NCCI Bundling Pairs (~230,000 rows, 5-10 min)
python scripts/data_ingestion/seed_ncci.py

# MUE Daily Limits (~8,000 rows, 1-2 min)
python scripts/data_ingestion/seed_mue.py

# ICD-10 Diagnosis & Procedure Codes (~175,000 rows, 5-10 min)
# This loads both CM (Diagnosis) and PCS (Procedure) datasets
python scripts/data_ingestion/seed_icd10.py
```

All scripts are **idempotent** — they use `Prefer: resolution=merge-duplicates`
so re-running them is safe and will just update existing rows.

## Step 4 — Verify in Supabase

After seeding, check row counts in the Supabase Table Editor:

| Table | Expected rows |
|-------|--------------|
| `cpt_medicare_fees` | ~9,000–11,000 |
| `ncci_ptp_edits` | ~200,000–250,000 |
| `mue_limits` | ~7,000–9,000 |
| `medical_codes` (ICD10) | ~95,000 |
| `medical_codes` (ICD10PCS) | ~80,000 |

## How the Audit Engine Uses These

- **`cpt_medicare_fees`** → `auditor.js: runDatabaseCheck()` — benchmark pricing per CPT
- **`ncci_ptp_edits`** → `api/audit-bill.js: runClinicalEngine()` — full NCCI bundling
- **`mue_limits`** → Currently used inline from `constants.js`; to use the DB table,
  update the `lookup_codes` Supabase Edge Function to also query `mue_limits` and
  return `mue: { [code]: limit }` back to the client's `runFrequencyAudit()`.

## Annual Updates

CMS releases updated files quarterly (January, April, July, October).
To refresh: delete the CSVs in `data/`, re-run `download_cms_data.py`, then re-run the seed scripts.
