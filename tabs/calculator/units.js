/**
 * MediHelp — Unit Conversion Module
 * All calculations use SI internally; this module handles display conversion only.
 */
window.CalcUnits = {
  _STORAGE: 'mh_unit_system',

  get system() { return localStorage.getItem(this._STORAGE) || 'SI'; },
  setSystem(s) { localStorage.setItem(this._STORAGE, s); },

  // Conversion factors: each entry = { si, us, toUS(v), toSI(v), siUnit, usUnit, siRange, usRange }
  GROUPS: {
    weight: {
      siUnit: 'kg', usUnit: 'lbs',
      siRange: '1–150', usRange: '2–330',
      toUS: v => +(v * 2.20462).toFixed(1),
      toSI: v => +(v / 2.20462).toFixed(2)
    },
    height: {
      siUnit: 'cm', usUnit: 'in',
      siRange: '100–220', usRange: '39–87',
      toUS: v => +(v / 2.54).toFixed(1),
      toSI: v => +(v * 2.54).toFixed(1)
    },
    creatinine: {
      siUnit: 'µmol/L', usUnit: 'mg/dL',
      siRange: '45–130', usRange: '0.5–1.5',
      toUS: v => +(v / 88.42).toFixed(2),   // µmol/L → mg/dL
      toSI: v => +(v * 88.42).toFixed(1)    // mg/dL → µmol/L
    },
    bilirubin: {
      siUnit: 'µmol/L', usUnit: 'mg/dL',
      siRange: '3–20', usRange: '0.2–1.2',
      toUS: v => +(v / 17.1).toFixed(2),
      toSI: v => +(v * 17.1).toFixed(1)
    },
    glucose: {
      siUnit: 'mmol/L', usUnit: 'mg/dL',
      siRange: '3.0–8.5', usRange: '54–153',
      toUS: v => +(v * 18.016).toFixed(0),
      toSI: v => +(v / 18.016).toFixed(2)
    },
    temperature: {
      siUnit: '°C', usUnit: '°F',
      siRange: '35–42', usRange: '95–108',
      toUS: v => +((v * 9/5) + 32).toFixed(1),
      toSI: v => +((v - 32) * 5/9).toFixed(1)
    },
    sodium: {
      siUnit: 'mmol/L', usUnit: 'mEq/L',
      siRange: '135–145', usRange: '135–145',
      toUS: v => +v,   // mmol/L = mEq/L for sodium; no real conversion
      toSI: v => +v
    }
  },

  /**
   * Get the current display unit for a group
   */
  getUnit(group) {
    const g = this.GROUPS[group];
    if (!g) return '';
    return this.system === 'US' ? g.usUnit : g.siUnit;
  },

  /**
   * Get the range string for placeholder display
   */
  getRange(group) {
    const g = this.GROUPS[group];
    if (!g) return '';
    return this.system === 'US' ? g.usRange : g.siRange;
  },

  /**
   * Convert a displayed value to SI for calculation
   * @param {number} val - value in currently displayed unit
   * @param {string} group - unitGroup name
   * @returns {number} value in SI unit
   */
  toSI(val, group) {
    const g = this.GROUPS[group];
    if (!g || this.system === 'SI') return +val;
    return g.toSI(+val);
  },

  /**
   * Convert a SI default to the current display unit (for populating input defaults)
   */
  fromSI(val, group) {
    const g = this.GROUPS[group];
    if (!g || this.system === 'SI') return +val;
    return g.toUS(+val);
  },

  /**
   * Convert all form values that have a unitGroup to SI before computation
   */
  convertFormToSI(vals, schema) {
    const out = Object.assign({}, vals);
    (schema.inputs || []).forEach(inp => {
      let grp = inp.unitGroup;
      if (!grp) {
        const id = inp.id.toLowerCase();
        const unit = (inp.unit || '').toLowerCase();
        if (id.includes('weight') || unit === 'kg' || unit === 'lbs') grp = 'weight';
        else if (id.includes('height') || unit === 'cm' || unit === 'in') grp = 'height';
        else if (id === 'creatinine' || id === 'scr' || id === 'cr') grp = 'creatinine';
        else if (id === 'bilirubin' || id === 'bili') grp = 'bilirubin';
        else if (id === 'glucose') grp = 'glucose';
        else if (unit === '°c' || unit === '°f' || id.includes('temp')) grp = 'temperature';
        else if (id === 'na' || id === 'sodium') grp = 'sodium';
      }
      if (grp && out[inp.id] !== undefined && out[inp.id] !== '') {
        out[inp.id] = this.toSI(+out[inp.id], grp);
      }
    });
    return out;
  }
};
