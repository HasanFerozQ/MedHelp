console.log('MediHelp: negotiation.js loaded.');
(function() {
  'use strict';

  function getCurrentSavingsValue() {
    const n = Number(window.currentEngineSavings || 0);
    return Number.isFinite(n) ? n : 0;
  }

  function updateNegotiatorSavingsPreview() {
    const savings = getCurrentSavingsValue();
    const label = `Current Savings Potential: $${savings.toFixed(2)}`;
    const top = document.getElementById('negotiator-savings-preview');
    const modal = document.getElementById('neg-savings-value');
    if (top) top.textContent = label;
    if (modal) modal.textContent = `$${savings.toFixed(2)}`;
  }

  function initNegotiatorIntake() {
    const form = document.getElementById('negotiator-form');
    if (!form) return;

    const visitType = document.getElementById('neg-visit-type');
    const visitOther = document.getElementById('neg-visit-other');
    const fullName = document.getElementById('neg-full-name');
    const signName = document.getElementById('neg-sign-name');
    const signDate = document.getElementById('neg-sign-date');
    const consentBtn = document.getElementById('neg-consent-btn');
    const signatureStatus = document.getElementById('neg-signature-status');
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
      fd.append('authorizationConsent', String(!!document.getElementById('neg-auth-consent')?.checked));
      fd.append('successFeeConsent', String(!!document.getElementById('neg-success-fee')?.checked));
      fd.append('upfrontFeeConsent', String(!!document.getElementById('neg-upfront-fee')?.checked));
      fd.append('signatureName', (signName?.value || '').trim());
      fd.append('signatureDate', (signDate?.value || '').trim());
      fd.append('savingsPotential', getCurrentSavingsValue().toFixed(2));
      fd.append('findingsCount', String((window.currentEngineFindings || []).length));
      fd.append('source', 'audit-page');

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
          result.textContent = `Submitted successfully. Your Case ID: ${d.caseId}`;
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
          authorizationConsent: String(!!document.getElementById('neg-auth-consent')?.checked),
          successFeeConsent: String(!!document.getElementById('neg-success-fee')?.checked),
          upfrontFeeConsent: String(!!document.getElementById('neg-upfront-fee')?.checked),
          signatureName: (signName?.value || '').trim(),
          signatureDate: (signDate?.value || '').trim(),
          savingsPotential: getCurrentSavingsValue().toFixed(2),
          findingsCount: String((window.currentEngineFindings || []).length),
          billFileName: billFile?.name || '',
          eobFileName: eobFile?.name || ''
        });
        if (result) {
          result.style.color = fallback ? '#f59e0b' : '#ef4444';
          result.textContent = fallback
            ? 'API unavailable. Opened email draft fallback. Please attach Bill/EOB and send.'
            : `Submission failed: ${err.message}`;
        }
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
