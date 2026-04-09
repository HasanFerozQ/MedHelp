// ── Stage 3: Validation / Audit Engine Module (v6.0) ──

class BucketAuditor {
  constructor(rows, multiplier = 2.5, npis = [], gpci = 1.0, isFacility = false, profile = null) {
    this.rows             = rows;
    this.multiplier       = multiplier;
    this.npis             = npis;
    this.gpci             = gpci;
    this.isFacility       = isFacility || (profile?.facilityMode || false);
    this.profile          = profile;
    this.findings         = [];
    this.potentialSavings = 0;
    this.totalBenchmark   = 0;
    this.dbCheckRan       = false;
    this._rowSavings      = {}; // per-row savings tracker for waterfall deduplication
    this._voidedRows      = new Set(); // rows fully voided (duplicate/bundle) — no further savings
    this._lineItemSum     = 0;
    this._benchmarkHits   = 0;
    this._hasReconError   = false;
  }

  addFinding(category, title, detail, type = 'warn', codeRef = '') {
    this.findings.push({ category, title, detail, type, codeRef });
  }

  /**
   * addRowSavings — Waterfall model.
   * Once a row is voided (_voidedRows), no further savings are added.
   * Per-row cap: never add more than the row's own total.
   */
  addRowSavings(rowIdx, amount, rowTotal) {
    if (amount <= 0) return;
    if (this._voidedRows.has(rowIdx)) return; // row already fully voided — skip
    const cap     = rowTotal > 0 ? rowTotal : amount;
    const already = this._rowSavings[rowIdx] || 0;
    const canAdd  = Math.max(0, cap - already);
    const actual  = Math.min(amount, canAdd);
    this._rowSavings[rowIdx] = already + actual;
    this.potentialSavings   += actual;
  }

  /** Mark a row as fully voided — no further savings will stack on it */
  voidRow(rowIdx) {
    this._voidedRows.add(rowIdx);
  }

  finalizeDeduplication() {
    this.potentialSavings = Math.round(this.potentialSavings * 100) / 100;
  }

  // ── LAYER 1B — NCCI Bundling ─────────────────────────────────────────────
  runBundling() {
    const codesByDate = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const d = r.date || 'UNDATED';
      if (!codesByDate[d]) codesByDate[d] = [];
      codesByDate[d].push({ r, idx });
    });

    Object.entries(codesByDate).forEach(([date, entries]) => {
      const presentCodes = new Set(entries.map(e => e.r.code));

      entries.forEach(({ r, idx }) => {
        const primarySet = (window.NCCI_PAIRS || {})[r.code];
        if (!primarySet) return;

        const conflictingPrimary = [...primarySet].find(p => presentCodes.has(p));
        if (!conflictingPrimary) return;

        const mod = (r.modifier || '').replace(/^-/, '');
        if (['59', 'XE', 'XS', 'XP', 'XU'].includes(mod)) return;

        this.addFinding('bundling', 'NCCI Bundle Violation',
          `CPT ${r.code} is a component service of ${conflictingPrimary} per CMS NCCI edits (CMS Claims Processing Manual, Chapter 23) and should not be billed separately on ${date}. Add -59 modifier only if service was truly distinct.`,
          'danger', r.code);
        if (r.raw) r.raw.classList.add('audit-row-error');
        this.addRowSavings(idx, r.total, r.total);
        this.voidRow(idx); // voided — no further savings
      });
    });
  }

  getBenchmark(code) {
    const base = (window.INLINE_BENCHMARK || {})[code] || null;
    if (!base) return null;
    let price = base.price * parseFloat(this.gpci || 1.0);
    if (this.isFacility) price *= (window.FACILITY_PROF_MULT || 0.78);
    return { price, desc: base.desc };
  }

  // ── LAYER 1A — Arithmetic Accuracy ───────────────────────────────────────
  runArithmetic() {
    this._lineItemSum = 0;
    this.rows.forEach((r, idx) => {
      if (r.raw) r.raw.classList.remove('audit-row-error', 'audit-row-warn', 'audit-row-info');
      if (r.isTotalRow) return;
      this._lineItemSum += r.total;

      if (this._voidedRows.has(idx)) return; // skip voided rows

      // 1a. qty × price = total (skip rows where price was back-derived)
      const q = Math.min(Math.max(parseInt(r.qty, 10) || 1, 1), 999);
      if (!r.priceWasDerived && r.total > 0 && r.price > 0) {
        const expected = Math.round(q * r.price * 100) / 100;
        if (Math.abs(expected - r.total) > 0.15) {
          this.addFinding('arithmetic', 'Math Mismatch',
            `${r.code || r.desc}: ${r.qty} × $${r.price.toFixed(2)} = $${expected.toFixed(2)}, but billed $${r.total.toFixed(2)}. (CMS Claims Processing Manual, Chapter 1 §30.2.5)`,
            'danger', r.code);
          if (r.raw) r.raw.classList.add('audit-row-error');
          if (r.total > expected) this.addRowSavings(idx, r.total - expected, r.total);
        }
      }

      // 1b. paid + owed ≈ total
      if (r.total > 0 && (r.paid > 0 || r.owed > 0)) {
        const sumPO = Math.round((r.paid + r.owed) * 100) / 100;
        const diff  = Math.abs(sumPO - r.total);
        if (diff > 1.00 && diff > r.total * 0.05) {
          this.addFinding('arithmetic', 'Responsibility Gap',
            `${r.code || r.desc}: Ins. paid ($${r.paid.toFixed(2)}) + Patient owed ($${r.owed.toFixed(2)}) = $${sumPO.toFixed(2)}, doesn't match billed $${r.total.toFixed(2)}. Check for missing contractual adjustment.`,
            'warn', r.code);
        }
      }

      // 1c. Negative balance — COMPLIANCE ALERT (not success)
      if (r.total < -0.01) {
        this.addFinding('financial', 'Credit Balance Liability (CMS Compliance)',
          `${r.code || r.desc} has a negative billed amount ($${r.total.toFixed(2)}). Per CMS guidelines (Medicare Claims Processing Manual, Chapter 4 §50), credit balances must be reported and refunded within 60 days. This is a provider compliance risk — request an immediate refund.`,
          'danger', r.code);
        if (r.raw) r.raw.classList.add('audit-row-error');
      } else if (r.total < 0) {
        this.addFinding('arithmetic', 'Negative Amount',
          `${r.code || r.desc} contains a negative dollar value. Verify it is an authorized credit adjustment.`, 'warn', r.code);
      }

      // 1d. Overpayment
      if (r.paid > r.total && r.total > 0) {
        this.addFinding('financial', 'Insurance Overpayment Anomaly',
          `${r.code || r.desc}: Insurance payment ($${r.paid.toFixed(2)}) exceeds the billed total ($${r.total.toFixed(2)}).`, 'warn', r.code);
        if (r.raw) r.raw.classList.add('audit-row-warn');
      }
    });
  }

  // ── LAYER 1E — Duplicate Detection ───────────────────────────────────────
  runDuplicates() {
    const registry = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const dKey = r.date || 'UNDATED';
      const key  = `${dKey}|${r.code}|${r.modifier || ''}`;
      (registry[key] = registry[key] || []).push({ r, idx });
    });
    Object.values(registry).forEach(entries => {
      if (entries.length < 2) return;
      const { r } = entries[0];
      const label = r.code + (r.modifier ? '-' + r.modifier : '');
      this.addFinding('duplicate', 'Duplicate Charge',
        `CPT ${label} appears ${entries.length}× on ${r.date || 'same date'}. Only one is typically payable per CMS Claims Processing Manual, Chapter 4 §20.4.`,
        'danger', r.code);
      entries.forEach(({ r: er }) => { if (er.raw) er.raw.classList.add('audit-row-error'); });
      // Void all duplicate entries after the first (waterfall)
      for (let i = 1; i < entries.length; i++) {
        this.addRowSavings(entries[i].idx, entries[i].r.total, entries[i].r.total);
        this.voidRow(entries[i].idx);
      }
    });
  }

  // ── LAYER 1F — Frequency (MUE) ───────────────────────────────────────────
  runFrequencyAudit() {
    const freq = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const key = `${r.date || 'UNDATED'}|${r.code}`;
      (freq[key] = freq[key] || []).push({ r, idx });
    });
    Object.entries(freq).forEach(([key, entries]) => {
      const code  = entries[0].r.code;
      const limit = (window.MUE_LIMITS || {})[code];
      if (!limit) return;
      const totalUnits = entries.reduce((s, e) => s + (parseInt(e.r.qty, 10) || 1), 0);
      if (totalUnits > limit) {
        const date = entries[0].r.date || 'same date';
        this.addFinding('frequency', 'Frequency Limit Exceeded (MUE)',
          `CPT ${code} billed ${totalUnits}× units on ${date}. CMS Medicare MUE guidelines limit this code to ${limit}/day. Excess units are non-payable.`,
          'danger', code);
        let allowance = limit;
        entries.forEach(e => {
          if (this._voidedRows.has(e.idx)) return;
          const rowQty = Math.min(Math.max(parseInt(e.r.qty, 10) || 1, 1), 999);
          if (allowance <= 0) {
            this.addRowSavings(e.idx, e.r.total, e.r.total);
            this.voidRow(e.idx);
          } else if (rowQty > allowance) {
            const unitPrice = e.r.total / rowQty;
            const excess    = rowQty - allowance;
            this.addRowSavings(e.idx, excess * unitPrice, e.r.total);
            allowance = 0;
          } else {
            allowance -= rowQty;
          }
        });
      }
    });
  }

  // ── LAYER 1D — Financial Reconciliation ──────────────────────────────────
  runFinancialSummaryAudit() {
    const totalBilled = this._lineItemSum || 0;
    const totalPaid   = this.rows.filter(r => !r.isTotalRow).reduce((s, r) => s + r.paid, 0);
    const totalOwed   = this.rows.filter(r => !r.isTotalRow).reduce((s, r) => s + r.owed, 0);
    const reconSum    = Math.round((totalPaid + totalOwed) * 100) / 100;
    const gap         = Math.abs(totalBilled - reconSum);

    if (totalPaid > totalBilled * 1.05 && totalPaid > 100) {
      this._hasReconError = true;
      this.addFinding('financial', 'Insurance Overpayment Detected',
        `Total insurance paid ($${totalPaid.toFixed(2)}) exceeds total billed ($${totalBilled.toFixed(2)}). This signals a critical audit error or billing fraud.`,
        'danger');
    }
    if (totalOwed < -0.01) {
      this._hasReconError = true;
      this.addFinding('financial', 'Negative Patient Balance',
        `Patient total responsibility is negative ($${totalOwed.toFixed(2)}). This indicates you are owed a refund for previous overpayments.`,
        'danger');
    }
    if (gap > 100 && gap > totalBilled * 0.10) {
      this._hasReconError = true;
      this.addFinding('financial', 'Responsibility Reconciliation Gap',
        `Billed ($${totalBilled.toFixed(2)}) does not balance with Paid+Owed ($${reconSum.toFixed(2)}). A $${gap.toFixed(2)} discrepancy suggests missing contractual adjustments or unrecorded payments.`,
        'warn');
    }
    // Zero-Pay High Value Signal
    this.rows.forEach(r => {
      if (!r.isTotalRow && r.total > 500 && r.paid === 0) {
        this.addFinding('financial', 'Zero Insurance Payment Alert',
          `Line item "${r.desc}" billed at $${r.total.toFixed(2)} shows $0.00 insurance payment. This is a red flag for a "Silent Denial" or processing oversight.`,
          'warn', r.code);
      }
    });
  }

  // ── LAYER 1H — Place of Service (POS) Validation ─────────────────────────
  // Single authoritative POS check — NOT duplicated in runClinicalCompatibilityAudit
  runPOSAudit() {
    const inpatientCodes = new Set(['99221', '99222', '99223', '99231', '99232', '99233']);
    const edCodes        = new Set(['99281', '99282', '99283', '99284', '99285']);

    if (!this.isFacility) {
      this.rows.forEach(r => {
        if (!r.code || r.isTotalRow || r.isDRG) return;
        if (inpatientCodes.has(r.code)) {
          this.addFinding('POS', 'Institutional Code Mismatch',
            `Hospital Inpatient CPT ${r.code} detected while in "Office/Clinic" mode. This is a Place-of-Service (POS) mismatch per CMS Claims Processing Manual Chapter 26 §10.5. Verify if service was actually provided in a hospital (POS 21).`,
            'danger', r.code);
        } else if (edCodes.has(r.code)) {
          this.addFinding('POS', 'Emergency Dept Code on Non-Facility Claim',
            `ED Code ${r.code} detected on what appears to be a non-facility claim. Verify POS code is 23 (Emergency Room).`,
            'warn', r.code);
        }
      });
    }
  }

  // ── LAYER 1I — Multiple Procedure Audit (-51) ─────────────────────────────
  runMultipleProcedureAudit() {
    const dates = {};
    this.rows.forEach((r, idx) => {
      if (!isSurgeryCode(r.code) || r.isTotalRow) return;
      const d = r.date || 'UNDATED';
      (dates[d] = dates[d] || []).push({ r, idx });
    });
    Object.entries(dates).forEach(([date, entries]) => {
      if (entries.length < 2) return;
      const missing51 = entries.filter(e => {
        const mod = (e.r.modifier || '').replace(/^-/, '');
        return mod !== '51';
      });
      if (missing51.length >= 2) {
        this.addFinding('modifier', 'Multiple Procedure Reduction Missing (-51)',
          `Multiple surgical procedures (${entries.length}) billed on ${date} without a -51 modifier. Primary payers typically discount the second procedure by 50%. Potential overcharge detected.`,
          'warn');
      }
    });
  }

  // ── LAYER 2A — Clinical Compatibility ────────────────────────────────────
  // NOTE: POS check has been removed from this method — it lives exclusively in runPOSAudit()
  runClinicalCompatibilityAudit() {
    const codesByDate = {};
    this.rows.forEach(r => {
      if (!r.code || r.isTotalRow) return;
      const d = r.date || 'UNDATED';
      (codesByDate[d] = codesByDate[d] || new Set()).add(r.code);
    });

    this.rows.forEach(r => {
      if (!r.code || r.isTotalRow) return;
      const rule = (window.CPT_CLINICAL_GROUPS || {})[r.code];
      if (!rule) return;
      const sameDayCodes = codesByDate[r.date || 'UNDATED'] || new Set();

      // Required companion code missing
      if (rule.requires) {
        const hasCompanion = [...rule.requires].some(c => sameDayCodes.has(c));
        if (!hasCompanion && sameDayCodes.size > 1) {
          this.addFinding('compatibility', 'Isolated Procedure — Missing Clinical Support',
            `${rule.label} billed without any expected support codes on ${r.date || 'this date'}. US Medicare guidelines suggest this procedure should exist within a high-level diagnostic context.`,
            'warn', r.code);
        }
      }

      // Incompatible code present same day
      if (rule.incompatible) {
        const incompatibleList = rule.incompatible instanceof Set ? [...rule.incompatible] : rule.incompatible;
        incompatibleList.forEach(bad => {
          if (sameDayCodes.has(bad)) {
            this.addFinding('compatibility', 'Clinically Incompatible Service Pair',
              `${rule.label} and CPT ${bad} billed on the same date (${r.date || 'unknown'}). These services are clinically incompatible when performed together — verify encounter documentation.`,
              'danger', r.code);
          }
        });
      }
    });
  }

  // ── LAYER 2G — DX–Procedure Mismatch (CO-11) ─────────────────────────────
  /**
   * Uses the ICD-10 codes extracted by the parser (r.dx) to verify that the
   * billed CPT category is clinically coherent with the reported diagnosis.
   * Example: ECG (93000 → E&M/Medicine) with ICD-10 S72.001A (fracture → Surgery/EM)
   *          → 'I' chapter would normally be Cardiac... S chapter allows Surgery but not cardiac-only.
   */
  runDXCompatibilityAudit() {
    const compatMap = window.DX_CPT_COMPAT || {};
    this.rows.forEach(r => {
      if (!r.code || r.isTotalRow || !r.dx || r.dx.length === 0) return;
      const cptCategory = classifyCPT(r.code);
      if (!cptCategory) return;

      r.dx.forEach(dx => {
        if (!dx || dx.length < 3) return;
        const chapter = dx[0].toUpperCase(); // ICD-10 first letter = chapter
        const allowed = compatMap[chapter];
        if (!allowed) return; // unknown chapter — skip

        if (!allowed.includes(cptCategory)) {
          this.addFinding('compatibility', 'DX–Procedure Mismatch (CO-11)',
            `CPT ${r.code} (${cptCategory}) is billed with diagnosis ${dx} which falls under ICD-10 chapter "${chapter}". This pairing is clinically inconsistent and is a common CO-11 denial reason. Request the visit note to verify medical necessity.`,
            'danger', r.code);
        }
      });
    });
  }

  // ── LAYER 1I — Multiple Provider NPI Resolution ──────────────────────────
  async resolveNPIProviders() {
    if (this.npis.length === 0) return;
    const uniqueNPIs      = [...new Set(this.npis)].slice(0, 3);
    const resolvedProviders = [];

    await Promise.allSettled(
      uniqueNPIs.map(async (npi, index) => {
        try {
          const ctrl  = new AbortController();
          const timer = setTimeout(() => ctrl.abort(), 4000);
          const res   = await fetch(`${window.NPPES_API || 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number='}${npi}`, { signal: ctrl.signal });
          clearTimeout(timer);
          if (!res.ok) return;
          const data = await res.json();
          if (!data.results?.length) return;

          const p         = data.results[0];
          const name      = p.basic.organization_name || `${p.basic.first_name} ${p.basic.last_name}`;
          const specialty = p.taxonomies?.[0]?.desc || 'Medical Professional';
          const role      = index === 0 ? 'Billing' : 'Rendering';

          resolvedProviders.push({ npi, name, specialty, role });

          if (role === 'Rendering') {
            const isPsychBilling  = this.rows.some(r => r.code === '90837' || r.code === '90834');
            const isSurgeryBilling= this.rows.some(r => isSurgeryCode(r.code));
            const isPsychSpec     = /psych|mental|behav/i.test(specialty);
            const isSurgSpec      = /surg/i.test(specialty);
            if (isPsychBilling && isSurgeryBilling && !isPsychSpec && !isSurgSpec) {
              this.addFinding('compatibility', 'Provider Specialty Mismatch',
                `Rendering provider ${name} (${specialty}) is billing codes from clinically incompatible specialties (Psychotherapy + Surgery) in the same encounter. Verify correct NPI was used.`,
                'warn');
            }
          }
        } catch (e) {
          console.warn(`NPI resolution error for ${npi}:`, e);
        }
      })
    );

    if (resolvedProviders.length > 0) {
      const primary   = resolvedProviders[0];
      const container = document.getElementById('verified-provider-container');
      const content   = document.getElementById('provider-card-content');
      if (container && content) {
        container.style.display = 'block';
        const otherDocs = resolvedProviders.slice(1);
        const otherHtml = otherDocs.length > 0
          ? `<div style="margin-top:8px;padding-top:8px;border-top:1px solid var(--border);font-size:11px;color:var(--text-muted);">
               Found other associated NPIs: ${otherDocs.map(o => `<b>${o.name}</b> (${o.role})`).join(', ')}
             </div>`
          : '';
        content.innerHTML = `
          <div style="display:flex;align-items:flex-start;gap:12px;">
            <div style="background:var(--accent);color:white;width:36px;height:36px;border-radius:8px;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
               <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
            </div>
            <div style="flex-grow:1;">
              <div style="font-size:14px;font-weight:700;color:var(--text-main);line-height:1.2;">${primary.name}</div>
              <div style="font-size:12px;color:var(--accent);font-weight:600;margin-top:2px;">${primary.specialty}</div>
              <div style="display:flex;gap:6px;margin-top:8px;flex-wrap:wrap;">
                <span style="font-size:10px;padding:2px 6px;background:rgba(6,182,212,0.1);border:1px solid var(--accent);border-radius:4px;color:var(--accent);font-weight:700;">NPI: ${primary.npi}</span>
                <span style="font-size:10px;padding:2px 6px;background:rgba(59,130,246,0.1);border:1px solid #3b82f6;border-radius:4px;color:#3b82f6;font-weight:700;">${primary.role} Provider</span>
              </div>
            </div>
          </div>
          ${otherHtml}
        `;
      }
      this._verifiedProviders = resolvedProviders;
      this._verifiedProvider  = primary.name;
    }
  }

  // ── LAYER 1E — Institutional DRG Audit ───────────────────────────────────
  runDRGAudit() {
    this.rows.forEach((r, idx) => {
      if (!r.isDRG || r.total <= 0) return;
      const bench    = (window.DRG_BENCHMARKS || {})[r.code];
      const weight   = bench ? bench.weight : 1.0;
      const expected = DRG_BASE_RATE * weight;
      if (r.total > expected * 2.0) {
        this.addFinding('benchmark', 'Excessive Hospital Charge (DRG)',
          `Institutional DRG ${r.code}${bench ? ` (${bench.desc})` : ''} billed at $${r.total.toFixed(2)} is extreme relative to the US Base Rate of $${expected.toFixed(2)}. Possible "revenue code" padding or severity-level upcoding.`,
          'danger', r.code);
        if (r.raw) r.raw.classList.add('audit-row-error');
        this.addRowSavings(idx, r.total - expected, r.total);
      } else if (r.total > expected * 1.5) {
        this.addFinding('benchmark', 'High DRG Variance',
          `Institutional DRG ${r.code} exceeds national benchmark. Verify if this hospital is in a high-cost outlier category.`,
          'warn', r.code);
      }
    });
  }

  runInvoiceSumCheck() {
    const totalRow = this.rows.find(r => r.isTotalRow && r.total > 0);
    if (!totalRow) return;
    const diff = Math.abs(this._lineItemSum - totalRow.total);
    if (diff > 1.00) {
      this.addFinding('arithmetic', 'Invoice Total Mismatch',
        `Line items sum to $${this._lineItemSum.toFixed(2)} but invoice total shows $${totalRow.total.toFixed(2)} — a $${diff.toFixed(2)} discrepancy.`,
        'danger');
    }
  }

  // ── LAYER 2B — Pricing Consistency ───────────────────────────────────────
  runConsistency() {
    const codeGroups = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow || r.price <= 0 || r.priceWasDerived) return;
      (codeGroups[r.code] = codeGroups[r.code] || []).push({ price: r.price, date: r.date, idx });
    });
    Object.entries(codeGroups).forEach(([code, entries]) => {
      if (entries.length < 2) return;
      const prices = entries.map(e => e.price);
      const max = Math.max(...prices), min = Math.min(...prices);
      if (min > 0 && max / min > 1.50 && max - min > 50) {
        this.addFinding('consistency', 'Unit Price Inconsistency',
          `CPT ${code} billed at $${min.toFixed(2)}–$${max.toFixed(2)} across visits (${Math.round((max/min-1)*100)}% variance, $${(max-min).toFixed(2)} gap). Possible fee-schedule error.`,
          'warn', code);
      }
    });
  }

  // ── LAYER 2C — Semantic Flags ─────────────────────────────────────────────
  runSemantic() {
    const KEYWORDS = [
      { re: /not medically necessary/i,       title: 'Not Medically Necessary',   detail: 'Insurer may refuse payment — document clinical justification.' },
      { re: /non.?covered/i,                  title: 'Non-Covered Service',        detail: 'This service may not be covered by your plan.' },
      { re: /benefit maximum/i,               title: 'Benefit Limit Reached',      detail: 'Annual benefit cap may have been exceeded.' },
      { re: /coordination of benefits/i,      title: 'COB Detected',               detail: 'Multiple-insurer coordination — verify primary payer.' },
      { re: /experimental|investigational/i,  title: 'Experimental Service',       detail: 'Experimental treatments are routinely excluded.' },
      { re: /pre.?existing/i,                 title: 'Pre-Existing Condition',     detail: 'Verify this exclusion is still enforceable under ACA.' },
      { re: /out.?of.?network/i,              title: 'Out-of-Network Charge',      detail: 'Out-of-network rates can be 2–4× in-network. Dispute balance billing.' },
      { re: /prior auth|pre.?auth/i,          title: 'Prior Authorization Issue',  detail: 'Services without prior auth are commonly denied.' },
      { re: /\bdenied\b/i,                    title: 'Claim Denied',               detail: 'A denied line item on the EOB — you have 180 days to appeal.' },
      { re: /\bduplicate\b/i,                 title: 'Duplicate Flagged by Payer', detail: 'Insurer marked this a duplicate — review original claim.' },
      { re: /write.?off/i,                    title: 'Write-Off Note',             detail: 'You should NOT owe amounts the provider wrote off as contractual.' },
      { re: /limit\b.*\bexceed|exceed.*limit/i, title: 'Limit Exceeded',           detail: 'Annual or visit limit reached — check your plan documents.' },
      { re: /medical necessity/i,             title: 'Medical Necessity Note',     detail: 'Requires documentation of clinical need to be payable.' },
      { re: /patient responsibility waived/i, title: 'Waived Responsibility',      detail: 'Waiving co-pays can violate insurance contracts — verify.' },
    ];
    const fired = new Set();
    this.rows.forEach(r => {
      const haystack = `${r.desc || ''} ${r.code || ''}`.toLowerCase();
      KEYWORDS.forEach(({ re, title, detail }) => {
        if (!re.test(haystack)) return;
        if (fired.has(title)) {
          const existing = this.findings.find(f => f.title === title && f.category === 'semantic');
          if (existing && r.code && !existing.codeRef.includes(r.code)) {
            existing.codeRef += `, ${r.code}`;
            existing.detail  += ` (also: ${r.code})`;
          }
          return;
        }
        fired.add(title);
        this.addFinding('semantic', title, detail, 'warn', r.code || '');
      });
    });
  }

  // ── LAYER 2D — Clinical Completeness ─────────────────────────────────────
  runCompleteness() {
    this.rows.forEach(r => {
      if (r.total > 100 && !r.code && !r.isTotalRow && !/total/i.test(r.desc)) {
        this.addFinding('completeness', 'Unitemized Charge',
          `$${r.total.toFixed(2)} charge "${r.desc}" has no CPT code. Unitemized charges are legally disputable in most states.`, 'warn');
      }
    });

    const focus = this.profile?.auditFocus || [];
    if (focus.length === 0 || focus.includes('completeness')) {
      Object.entries(window.HIGH_COMPLEXITY_EM || {}).forEach(([code, info]) => {
        if (this.rows.find(r => r.code === code)) {
          this.addFinding('completeness', 'High-Level E&M — Upcoding Risk',
            `CPT ${code} (${info.label}) requires ≥${info.minMin} min of documented physician time. Frequently upcoded for short visits. Request visit notes per CMS Claims Processing Manual, Chapter 12 §30.6.`,
            'warn', code);
        }
      });
    }

    // Invalid code (neither CPT nor HCPCS L2)
    this.rows.forEach(r => {
      if (r.code && !classifyCPT(r.code)) {
        this.addFinding('completeness', 'Invalid Billing Code',
          `"${r.code}" does not match any valid CPT (10000–99999) or HCPCS Level II (Letter + 4 digits) format. Possible ZIP code or data-entry error.`, 'danger', r.code);
      }
    });

    const missingDates = this.rows.filter(r => !r.date && r.total > 50 && !r.isTotalRow).length;
    if (missingDates > 0) {
      this.addFinding('completeness', 'Missing Service Dates',
        `${missingDates} line item(s) have no service date. Dates are required for duplicate detection and claims verification.`, 'warn');
    }
  }

  // ── LAYER 2E — Modifier Validation ───────────────────────────────────────
  runModifiers() {
    const surgDates = new Set(
      this.rows.filter(r => r.code && isSurgeryCode(r.code)).map(r => r.date).filter(Boolean)
    );
    this.rows.forEach((r, idx) => {
      if (r.code && isEMCode(r.code) && r.date && surgDates.has(r.date)) {
        const mod = (r.modifier || '').replace(/^-/, '');
        if (!GLOBAL_PERIOD_OK_MODS.has(mod)) {
          this.addFinding('modifier', 'Global Package Violation',
            `CPT ${r.code} (E&M) billed on the same date as a surgery code without a -24, -25, or -57 modifier. May not be separately payable — see CMS Claims Processing Manual Chapter 12.`,
            'danger', r.code);
        }
      }
      if (!r.modifier) return;
      const mod = r.modifier.toUpperCase();
      if (mod === '59') {
        this.addFinding('modifier', 'Modifier -59 — Unbundling Risk',
          `CPT ${r.code}-59: Modifier -59 ("Distinct Procedural Service") is the most-abused NCCI unbundling bypass. Flag for manual review — verify services were truly separate.`,
          'warn', r.code);
      }
      if (mod === '25') {
        this.addFinding('modifier', 'Modifier -25 — E&M+Procedure Same Day',
          `CPT ${r.code}-25: Significant separate E&M on the same day as a procedure. Legitimate, but frequently billed inappropriately. Verify notes support a separate evaluation.`,
          'warn', r.code);
      }
      if (mod === '76' || mod === '77') {
        this.addFinding('modifier', `Modifier -${mod} — Repeat Procedure`,
          `CPT ${r.code}-${mod}: Repeat procedure modifier detected. Cross-check against duplicate detection — confirm this is a legitimately repeated service.`,
          'warn', r.code);
      }
    });
  }

  // ── LAYER 2F — Date-Range Sanity ─────────────────────────────────────────
  runDateSanity() {
    const dates = this.rows
      .map(r => parseDate(r.date))
      .filter(Boolean)
      .sort((a, b) => a - b);
    if (dates.length < 2) return;
    const spanDays = (dates[dates.length - 1] - dates[0]) / 86400000;
    if (spanDays > 365) {
      this.addFinding('date_sanity', 'Date Span Exceeds 1 Year',
        `Service dates on this bill span ${Math.round(spanDays)} days (${dates[0].toLocaleDateString()} – ${dates[dates.length-1].toLocaleDateString()}). A single bill covering >365 days is highly unusual and a potential red flag.`,
        'danger');
    }
    const today       = new Date();
    const futureDates = this.rows.filter(r => r.date && parseDate(r.date) > today);
    if (futureDates.length > 0) {
      this.addFinding('date_sanity', 'Future Service Date',
        `${futureDates.length} charge(s) have service dates in the future. This is a billing error.`, 'danger');
    }
  }

  // ── LAYER 3 — Benchmark + MUE + NCCI from Database ──────────────────────
  async runDatabaseCheck() {
    // Accept both CPT and HCPCS L2 codes
    const codes = [...new Set(this.rows.map(r => r.code).filter(c => !!c && isValidCPT(c)))];
    if (codes.length === 0) return;

    let feeMap  = {};
    let mueMap  = {}; // { [code]: { limit, mai, desc } }
    let ncciDB  = []; // [{ column1_code, column2_code, modifier_allowed }]

    try {
      const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
        method : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body   : JSON.stringify({ codes, npis: this.npis }),
      });
      if (res.ok) {
        const data = await res.json();
        feeMap  = data.fees  || {};
        mueMap  = data.mue   || {};  // ← full MUE table from DB
        ncciDB  = data.ncci  || [];  // ← full NCCI pairs from DB
        this.dbCheckRan = true;
      }
    } catch (_) {}

    // ── Merge DB MUE limits into the runtime window.MUE_LIMITS ──────────────
    // This means runFrequencyAudit() gains full ~8,000 code coverage automatically
    // without needing to be called again — it reads window.MUE_LIMITS at call time.
    if (Object.keys(mueMap).length > 0) {
      const liveMUE = window.MUE_LIMITS || {};
      Object.entries(mueMap).forEach(([code, m]) => {
        // DB value wins over inline (more up to date)
        liveMUE[code] = m.limit;
      });
      window.MUE_LIMITS = liveMUE;
      // Re-run frequency audit with enriched MUE table
      this.runFrequencyAudit();
    }

    // ── Merge DB NCCI pairs into runtime window.NCCI_PAIRS ───────────────────
    // Supplements the small inline table with the full ~230k pair dataset.
    if (ncciDB.length > 0) {
      const livePairs = window.NCCI_PAIRS || {};
      ncciDB.forEach((edit) => {
        const col1 = edit.column1_code;
        const col2 = edit.column2_code;
        if (!col1 || !col2) return;
        if (!livePairs[col1]) livePairs[col1] = new Set();
        // Set.add is safe even if already present
        livePairs[col1].add(col2);
      });
      window.NCCI_PAIRS = livePairs;
      // Re-run bundling with enriched NCCI table
      this.runBundling();
    }

    // ── Overlay inline benchmark for any code not in Supabase ────────────────
    codes.forEach(code => {
      if (!feeMap[code]) {
        const b = this.getBenchmark(code);
        if (b) feeMap[code] = { price: b.price };
      }
    });

    // ── Benchmark pricing check ───────────────────────────────────────────────
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow || this._voidedRows.has(idx)) return;
      const bench = feeMap[r.code];
      if (!bench) return;
      this._benchmarkHits++;
      const cap = bench.price * r.qty * this.multiplier;
      this.totalBenchmark += bench.price * r.qty;
      if (r.total > cap) {
        this.addFinding('benchmark', 'High Pricing Variance',
          `CPT ${r.code}: Billed $${r.total.toFixed(2)} vs ${this.multiplier}× Medicare benchmark $${cap.toFixed(2)}. Potential overcharge of $${(r.total - cap).toFixed(2)}. (CMS Medicare Physician Fee Schedule — cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeeSched)`,
          'warn', r.code);
        if (r.raw) r.raw.classList.add('audit-row-warn');
        this.addRowSavings(idx, r.total - cap, r.total);
      }
    });
  }

  // ── Confidence Scoring ────────────────────────────────────────────────────
  computeConfidence() {
    const total = this.rows.filter(r => !r.isTotalRow).length;
    if (total === 0) return { score: 0, reasons: ['No billable line items found.'] };
    const reasons = [];
    let score = 0;

    const withCode = this.rows.filter(r => r.code && !r.isTotalRow).length;
    const codeScore = Math.round((withCode / total) * 25);
    score += codeScore;
    if (withCode === total) reasons.push(`All ${total} charges have billing codes (+${codeScore})`);
    else if (withCode > 0) reasons.push(`${withCode}/${total} charges have billing codes (+${codeScore})`);
    else reasons.push('No billing codes found — very low confidence');

    const withDate  = this.rows.filter(r => r.date && !r.isTotalRow).length;
    const dateScore = Math.round((withDate / total) * 15);
    score += dateScore;
    if (withDate < total) reasons.push(`${total - withDate} charge(s) missing service dates (-${15 - dateScore})`);

    const withTotal = this.rows.filter(r => r.total > 0 && !r.isTotalRow).length;
    score += Math.round((withTotal / total) * 10);

    const withCode2  = Math.max(withCode, 1);
    const benchScore = Math.round((this._benchmarkHits / withCode2) * 25);
    score += Math.min(25, benchScore);
    if (this._benchmarkHits === 0) reasons.push('No benchmark data matched — pricing check limited');
    else if (benchScore >= 20) reasons.push(`Strong Medicare benchmark coverage (+${Math.min(25, benchScore)})`);
    else reasons.push(`Partial benchmark coverage (+${Math.min(25, benchScore)})`);

    const derived      = this.rows.filter(r => r.priceWasDerived && !r.isTotalRow).length;
    const derivedRatio = derived / total;
    const intScore     = Math.round(((total - derived) / total) * 15);
    score += intScore;
    if (derivedRatio > 0.5) {
      score -= 15;
      reasons.push('Over 50% of prices were derived (not audited against DB) — manual price entry suggested (-15)');
    }

    if (this.dbCheckRan) { score += 10; reasons.push('Remote clinical verification completed (+10)'); }

    if (this._hasReconError) {
      score -= 20;
      reasons.push('Significant financial reconciliation gap detected (-20)');
    }

    const missingQty = this.rows.filter(r => !r.qty && !r.isTotalRow).length;
    if (missingQty > 0) {
      score -= Math.min(10, missingQty * 2);
      reasons.push(`Missing quantity data on ${missingQty} lines (-${Math.min(10, missingQty * 2)})`);
    }

    const hardFails = this.findings.filter(f => f.type === 'danger').length;
    if (hardFails > 2) { score -= 15; reasons.push('Multiple critical clinical anomalies found (-15)'); }

    return { score: Math.min(100, Math.max(0, score)), reasons };
  }
}

// ── Render findings ───────────────────────────────────────────────────────────

const CATEGORY_META = {
  arithmetic:    { label: '🔢 Arithmetic',          color: '#ef4444' },
  duplicate:     { label: '🔁 Duplicate Charges',    color: '#f97316' },
  consistency:   { label: '📊 Pricing Consistency',  color: '#eab308' },
  semantic:      { label: '📄 Insurance Language',   color: '#a78bfa' },
  completeness:  { label: '📋 Completeness',         color: '#60a5fa' },
  modifier:      { label: '🔖 Modifier Audit',       color: '#fb923c' },
  benchmark:     { label: '💰 Benchmark Pricing',    color: '#34d399' },
  date_sanity:   { label: '📅 Date Validation',      color: '#f43f5e' },
  bundling:      { label: '🔗 Bundling (NCCI)',       color: '#ec4899' },
  frequency:     { label: '📊 Frequency (MUE)',      color: '#f43f5e' },
  financial:     { label: '⚖️ Financial Integrity',  color: '#10b981' },
  compatibility: { label: '🩺 Clinical Context',     color: '#06b6d4' },
  POS:           { label: '📍 Place of Service',     color: '#8b5cf6' },
};

window.BucketAuditor = BucketAuditor;
window.CATEGORY_META = CATEGORY_META;
