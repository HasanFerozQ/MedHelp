console.log('MediHelp: negotiation.js loaded.');
(function() {
  'use strict';

  function getCurrentSavingsValue() {
    const snap = window.currentNegotiationSnapshot || null;
    if (snap && Number.isFinite(Number(snap.savings))) return Number(snap.savings);
    const n = Number(window.currentEngineSavings || 0);
    return Number.isFinite(n) ? n : 0;
  }

  function getCurrentFindingsCount() {
    const snap = window.currentNegotiationSnapshot || null;
    if (snap && Number.isFinite(Number(snap.findingsCount))) return Number(snap.findingsCount);
    return Number((window.currentEngineFindings || []).length || 0);
  }

  function updateNegotiatorSavingsPreview() {
    const savings = getCurrentSavingsValue();
    const label = `Current Savings Potential: $${savings.toFixed(2)}`;
    const top = document.getElementById('negotiator-savings-preview');
    const modal = document.getElementById('neg-savings-value');
    const findingsEl = document.getElementById('neg-findings-value');
    const sourceEl = document.getElementById('neg-snapshot-source');
    if (top) top.textContent = label;
    if (modal) modal.textContent = `$${savings.toFixed(2)}`;
    if (findingsEl) findingsEl.textContent = String(getCurrentFindingsCount());
    if (sourceEl) sourceEl.textContent = window.currentNegotiationSnapshot?.sourceLabel || 'Current Audit';
  }

  async function refreshSnapshotFromUploadedBill(file) {
    if (!file) return;
    const statusEl = document.getElementById('neg-snapshot-status');
    if (statusEl) statusEl.textContent = 'Analyzing uploaded bill...';

    try {
      const fd = new FormData();
      fd.append('bill', file);
      const baseUrl = (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1')
        ? 'http://localhost:3000'
        : '';
      const res = await fetch(`${baseUrl}/api/audit-bill`, { method: 'POST', body: fd });
      const raw = await res.text();
      let data = {};
      try { data = JSON.parse(raw); } catch { throw new Error(`Server returned non-JSON response: ${raw.slice(0, 120)}`); }
      if (!res.ok || !data.ok) throw new Error(data.error || 'Unable to analyze uploaded bill');

      const savings = Number(data?.result?.potential_savings || 0);
      const findingsCount = Array.isArray(data?.result?.findings) ? data.result.findings.length : 0;
      window.currentNegotiationSnapshot = {
        savings,
        findingsCount,
        sourceLabel: 'Uploaded Bill',
        profile: data.extraction_profile || 'default_generic'
      };
      if (statusEl) statusEl.textContent = `Snapshot refreshed from uploaded bill (${window.currentNegotiationSnapshot.profile}).`;
      updateNegotiatorSavingsPreview();
    } catch (err) {
      window.currentNegotiationSnapshot = null;
      if (statusEl) statusEl.textContent = `Could not auto-analyze uploaded bill: ${err.message}. Using current audit results.`;
      updateNegotiatorSavingsPreview();
    }
  }

  function initNegotiatorIntake() {
    const form = document.getElementById('negotiator-form');
    if (!form) return;

    // Load reCAPTCHA v3 script dynamically if not present
    if (window.RECAPTCHA_SITE_KEY && !document.querySelector('script[src*="recaptcha/api.js"]')) {
      const script = document.createElement('script');
      script.src = `https://www.google.com/recaptcha/api.js?render=${window.RECAPTCHA_SITE_KEY}`;
      script.async = true;
      script.defer = true;
      document.head.appendChild(script);
    }

    const visitType = document.getElementById('neg-visit-type');
    const visitOther = document.getElementById('neg-visit-other');
    const fullName = document.getElementById('neg-full-name');
    const signName = document.getElementById('neg-sign-name');
    const signDate = document.getElementById('neg-sign-date');
    const consentBtn = document.getElementById('neg-consent-btn');
    const signatureStatus = document.getElementById('neg-signature-status');
    const billInput = document.getElementById('neg-bill');
    const result = document.getElementById('neg-submit-result');
    let signedAt = '';

    if (fullName && signName) {
      fullName.addEventListener('input', () => { signName.value = fullName.value.trim(); });
    }

    if (visitType && visitOther) {
      visitType.addEventListener('change', () => {
        visitOther.style.display = visitType.value === 'Other' ? 'block' : 'none';
        if (visitType.value !== 'Other') visitOther.value = '';
      });
    }

    if (consentBtn) {
      consentBtn.addEventListener('click', () => {
        const name = (fullName?.value || '').trim();
        if (!name) {
          alert('Please enter Full Name before digital consent.');
          return;
        }
        signedAt = new Date().toISOString();
        if (signName) signName.value = name;
        if (signDate) signDate.value = new Date().toLocaleDateString('en-US');
        if (signatureStatus) {
          signatureStatus.textContent = `Signed by ${name}`;
          signatureStatus.style.color = '#10b981';
        }
      });
    }

    if (billInput) {
      billInput.addEventListener('change', () => {
        const file = billInput.files?.[0];
        refreshSnapshotFromUploadedBill(file);
      });
    }

    // Drop-zone helpers: show the chosen file name + allow drag & drop onto the cards.
    function formatFileSize(bytes) {
      if (bytes === undefined || bytes === null) return '';
      if (bytes < 1024) return `${bytes} B`;
      if (bytes < 1024 * 1024) return `${Math.round(bytes / 1024)} KB`;
      return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
    }
    function bindDropZone(cardId, input, nameId, emptyText) {
      const card = document.getElementById(cardId);
      const nameEl = document.getElementById(nameId);
      if (!card || !input) return;
      const showName = () => {
        if (!nameEl) return;
        const file = input.files?.[0];
        if (file) {
          nameEl.textContent = `${file.name} (${formatFileSize(file.size)})`;
          nameEl.classList.add('has-file');
        } else {
          nameEl.textContent = emptyText;
          nameEl.classList.remove('has-file');
        }
      };
      input.addEventListener('change', showName);
      ['dragenter', 'dragover'].forEach((ev) => card.addEventListener(ev, (e) => { e.preventDefault(); card.classList.add('drag-over'); }));
      ['dragleave', 'drop'].forEach((ev) => card.addEventListener(ev, (e) => { e.preventDefault(); card.classList.remove('drag-over'); }));
      card.addEventListener('drop', (e) => {
        const file = e.dataTransfer?.files?.[0];
        if (!file) return;
        try {
          input.files = e.dataTransfer.files;
        } catch (_) { return; }
        input.dispatchEvent(new Event('change', { bubbles: true }));
      });
    }
    bindDropZone('neg-bill-card', billInput, 'neg-bill-name', 'No file chosen — PDF up to 8 MB');
    bindDropZone('neg-eob-card', document.getElementById('neg-eob'), 'neg-eob-name', 'No file chosen — optional');

    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      if (!signedAt) {
        alert('Please click "I Consent (Digital Signature)" before submitting.');
        return;
      }
      if (!(document.getElementById('neg-auth-consent')?.checked
        && document.getElementById('neg-success-fee')?.checked
        && document.getElementById('neg-upfront-fee')?.checked)) {
        alert('Please accept all required consent checkboxes before submitting.');
        return;
      }
      if (!(signName?.value || '').trim() || !(signDate?.value || '').trim()) {
        alert('Digital signature is incomplete. Please click "I Consent (Digital Signature)".');
        return;
      }

      const billFile = document.getElementById('neg-bill')?.files?.[0];
      if (!billFile) {
        alert('Please upload Bill (PDF).');
        return;
      }

      const selectedGoal = form.querySelector('input[name="neg-goal"]:checked');
      if (!selectedGoal) {
        alert('Please select what you want us to do.');
        return;
      }

      const submitForm = async (recaptchaToken = '') => {
        const fd = new FormData();
        fd.append('bill', billFile);
        const eobFile = document.getElementById('neg-eob')?.files?.[0];
        if (eobFile) fd.append('eob', eobFile);

        fd.append('fullName', (fullName?.value || '').trim());
        fd.append('email', (document.getElementById('neg-email')?.value || '').trim());
        fd.append('phone', (document.getElementById('neg-phone')?.value || '').trim());
        fd.append('providerName', (document.getElementById('neg-provider-name')?.value || '').trim());
        fd.append('billAmount', (document.getElementById('neg-bill-amount')?.value || '').trim());
        fd.append('dateOfService', (document.getElementById('neg-dos')?.value || '').trim());
        fd.append('hasInsurance', (document.getElementById('neg-insurance')?.value || '').trim());
        fd.append('claimStatus', (document.getElementById('neg-claim-status')?.value || '').trim());
        fd.append('visitType', (visitType?.value || '').trim());
        fd.append('visitTypeOther', (visitOther?.value || '').trim());
        fd.append('financialDifficulty', (document.getElementById('neg-financial-diff')?.value || '').trim());
        fd.append('monthlyIncome', (document.getElementById('neg-income-range')?.value || '').trim());
        fd.append('hardshipChecked', String(!!document.getElementById('neg-hardship')?.checked));
        fd.append('negotiationGoal', selectedGoal.value);
        const selectedIssues = Array.from(form.querySelectorAll('input[name="neg-issue"]:checked')).map((el) => el.value);
        fd.append('issues', selectedIssues.join('; '));
        fd.append('otherDetails', (document.getElementById('neg-other-details')?.value || '').trim());
        fd.append('authorizationConsent', String(!!document.getElementById('neg-auth-consent')?.checked));
        fd.append('successFeeConsent', String(!!document.getElementById('neg-success-fee')?.checked));
        fd.append('upfrontFeeConsent', String(!!document.getElementById('neg-upfront-fee')?.checked));
        fd.append('signatureName', (signName?.value || '').trim());
        fd.append('signatureDate', (signDate?.value || '').trim());
        fd.append('savingsPotential', getCurrentSavingsValue().toFixed(2));
        fd.append('findingsCount', String(getCurrentFindingsCount()));
        fd.append('source', 'audit-page');
        fd.append('recaptcha_token', recaptchaToken);

        if (result) {
          result.style.color = 'var(--text-muted)';
          result.textContent = 'Submitting intake...';
        }

        try {
          const baseUrl = (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1')
            ? 'http://localhost:3000'
            : '';
          const res = await fetch(`${baseUrl}/api/negotiation-intake`, { method: 'POST', body: fd });
          const raw = await res.text();
          let d = {};
          try { d = JSON.parse(raw); } catch { throw new Error(`Server returned non-JSON response: ${raw.slice(0, 120)}`); }
          if (!d.ok) throw new Error(d.error || 'Submission failed');

          if (result) {
            result.style.color = '#22c55e';
            result.innerHTML = `
              <div style="border:1px solid rgba(34,197,94,0.45); background:rgba(34,197,94,0.08); border-radius:10px; padding:12px;">
                <div style="font-size:13px; font-weight:800; color:#22c55e; margin-bottom:6px;">Submission Completed Successfully</div>
                <div style="font-size:12px; color:var(--text-main); margin-bottom:8px;">
                  Please save your Case ID for future communication:
                  <span style="font-weight:800; color:var(--text-h); margin-left:6px;">${d.caseId}</span>
                </div>
                <ol style="margin:0 0 0 16px; padding:0; font-size:12px; color:var(--text-main); line-height:1.6;">
                  <li>Process will take 3-5 working days.</li>
                  <li>SupportDesk will email payment link and details to your provided email for the $15 initiation fee.</li>
                  <li>After submission of initiation fee, negotiator starts audit and negotiations and contacts you with results.</li>
                  <li>Final payment details are shared after successful negotiations (15% of saved amount).</li>
                </ol>
              </div>
            `;
          }
        } catch (err) {
          const fallback = openMailtoFallback({
            fullName: (fullName?.value || '').trim(),
            email: (document.getElementById('neg-email')?.value || '').trim(),
            phone: (document.getElementById('neg-phone')?.value || '').trim(),
            providerName: (document.getElementById('neg-provider-name')?.value || '').trim(),
            billAmount: (document.getElementById('neg-bill-amount')?.value || '').trim(),
            dateOfService: (document.getElementById('neg-dos')?.value || '').trim(),
            hasInsurance: (document.getElementById('neg-insurance')?.value || '').trim(),
            claimStatus: (document.getElementById('neg-claim-status')?.value || '').trim(),
            visitType: (visitType?.value || '').trim(),
            visitTypeOther: (visitOther?.value || '').trim(),
            financialDifficulty: (document.getElementById('neg-financial-diff')?.value || '').trim(),
            monthlyIncome: (document.getElementById('neg-income-range')?.value || '').trim(),
            hardshipChecked: String(!!document.getElementById('neg-hardship')?.checked),
            negotiationGoal: selectedGoal.value,
            issues: Array.from(form.querySelectorAll('input[name="neg-issue"]:checked')).map((el) => el.value).join('; '),
            otherDetails: (document.getElementById('neg-other-details')?.value || '').trim(),
            authorizationConsent: String(!!document.getElementById('neg-auth-consent')?.checked),
            successFeeConsent: String(!!document.getElementById('neg-success-fee')?.checked),
            upfrontFeeConsent: String(!!document.getElementById('neg-upfront-fee')?.checked),
            signatureName: (signName?.value || '').trim(),
            signatureDate: (signDate?.value || '').trim(),
            savingsPotential: getCurrentSavingsValue().toFixed(2),
            findingsCount: String(getCurrentFindingsCount()),
            billFileName: billFile?.name || '',
            eobFileName: eobFile?.name || ''
          });
          if (result) {
            result.style.color = fallback ? '#f59e0b' : '#ef4444';
            result.textContent = fallback
              ? `Submission failed: ${err.message}. Opened email draft fallback — please attach Bill/EOB and send.`
              : `Submission failed: ${err.message}`;
          }
        }
      };

      if (typeof grecaptcha !== 'undefined') {
        grecaptcha.ready(() => {
          grecaptcha.execute(window.RECAPTCHA_SITE_KEY, { action: 'intake' })
            .then((token) => {
              submitForm(token);
            })
            .catch(() => {
              submitForm('');
            });
        });
      } else {
        submitForm('');
      }
    });

    updateNegotiatorSavingsPreview();
  }

  function openNegotiatorModal() {
    const modal = document.getElementById('negotiator-modal');
    if (!modal) return;
    updateNegotiatorSavingsPreview();
    modal.style.display = 'flex';
  }

  function closeNegotiatorModal() {
    const modal = document.getElementById('negotiator-modal');
    if (!modal) return;
    modal.style.display = 'none';
  }

  window.updateNegotiatorSavingsPreview = updateNegotiatorSavingsPreview;
  window.initNegotiatorIntake = initNegotiatorIntake;
  window.openNegotiatorModal = openNegotiatorModal;
  window.closeNegotiatorModal = closeNegotiatorModal;

  function openMailtoFallback(data) {
    try {
      const caseId = `MH-${new Date().toISOString().slice(0, 10).replace(/-/g, '')}-${Math.random().toString(16).slice(2, 8).toUpperCase()}`;
      const to = 'supportdesk@medihelp.live';
      const subject = encodeURIComponent(`MediHelp Negotiation Intake (Fallback) - ${caseId}`);
      const body = encodeURIComponent([
        `Case ID: ${caseId}`,
        '',
        'Fallback Intake (API unavailable)',
        '',
        `Full Name: ${data.fullName}`,
        `Email: ${data.email}`,
        `Phone: ${data.phone}`,
        `Provider: ${data.providerName}`,
        `Bill Amount: ${data.billAmount}`,
        `Date of Service: ${data.dateOfService}`,
        `Has Insurance: ${data.hasInsurance}`,
        `Claim Status: ${data.claimStatus}`,
        `Visit Type: ${data.visitType}`,
        `Visit Type Other: ${data.visitTypeOther}`,
        `Financial Difficulty: ${data.financialDifficulty}`,
        `Monthly Income: ${data.monthlyIncome}`,
        `Hardship Checked: ${data.hardshipChecked}`,
        `Negotiation Goal: ${data.negotiationGoal}`,
        `Issues Noticed: ${data.issues || ''}`,
        `Other Details: ${data.otherDetails || ''}`,
        `Authorization Consent: ${data.authorizationConsent}`,
        `15% Consent: ${data.successFeeConsent}`,
        `$15 Consent: ${data.upfrontFeeConsent}`,
        `Signature Name: ${data.signatureName}`,
        `Signature Date: ${data.signatureDate}`,
        `Savings Potential: $${data.savingsPotential}`,
        `Findings Count: ${data.findingsCount}`,
        '',
        `Selected Bill file: ${data.billFileName}`,
        `Selected EOB file: ${data.eobFileName}`,
        'Please attach the files manually before sending.'
      ].join('\n'));
      window.location.href = `mailto:${to}?subject=${subject}&body=${body}`;
      return true;
    } catch (_) {
      return false;
    }
  }
})();
