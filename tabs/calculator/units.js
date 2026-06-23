/**
 * MediHelp — Unit Conversion Module
 * Display units (SI/US per field) are converted to canonical units before every calculation.
 * Canonical units match clinical formulas: kg, cm, mg/dL (creatinine, glucose, bilirubin), °C.
 */
window.CalcUnits = {
  _STORAGE: 'mh_unit_system',

  get system() { return localStorage.getItem(this._STORAGE) || 'US'; },
  setSystem(s) { localStorage.setItem(this._STORAGE, s); },

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
      toUS: v => +(v / 88.42).toFixed(2),
      toSI: v => +(v * 88.42).toFixed(1)
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
      toUS: v => +((v * 9 / 5) + 32).toFixed(1),
      toSI: v => +((v - 32) * 5 / 9).toFixed(1)
    },
    sodium: {
      siUnit: 'mmol/L', usUnit: 'mEq/L',
      siRange: '135–145', usRange: '135–145',
      toUS: v => +v,
      toSI: v => +v
    },
    albumin: {
      siUnit: 'g/L', usUnit: 'g/dL',
      siRange: '35–55', usRange: '3.5–5.5',
      toUS: v => +(v / 10).toFixed(2),
      toSI: v => +(v * 10).toFixed(1)
    }
  },

  /** Groups where canonical (formula) unit is the US column (mg/dL, etc.) */
  _CANONICAL_IS_US: { creatinine: true, bilirubin: true, glucose: true, albumin: true },

  inferGroup(inp) {
    if (!inp) return '';
    if (inp.unitGroup) return inp.unitGroup;
    const id = (inp.id || '').toLowerCase();
    const unit = (inp.unit || '').toLowerCase();
    if (id.includes('weight') || unit === 'kg' || unit === 'lbs' || unit === 'lb') return 'weight';
    if (id.includes('height') || unit === 'cm' || unit === 'in') return 'height';
    if (id === 'creatinine' || id === 'scr' || id === 'cr') return 'creatinine';
    if (id === 'bilirubin' || id === 'bili') return 'bilirubin';
    if (id === 'glucose') return 'glucose';
    if (unit === '°c' || unit === '°f' || id.includes('temp')) return 'temperature';
    if (id === 'na' || id === 'sodium') return 'sodium';
    return '';
  },

  getUnit(group, displaySystem) {
    const g = this.GROUPS[group];
    if (!g) return '';
    const sys = displaySystem || this.system;
    return sys === 'US' ? g.usUnit : g.siUnit;
  },

  getRange(group, displaySystem) {
    const g = this.GROUPS[group];
    if (!g) return '';
    const sys = displaySystem || this.system;
    return sys === 'US' ? g.usRange : g.siRange;
  },

  /**
   * Convert displayed value → canonical formula unit (kg, cm, mg/dL, °C).
   * @param {number} val
   * @param {string} group
   * @param {'SI'|'US'} displaySystem - unit system shown in the input field
   */
  displayToCanonical(val, group, displaySystem) {
    const g = this.GROUPS[group];
    if (!g || val === '' || val === undefined || isNaN(+val)) return +val;
    const n = +val;
    const canonicalIsUS = !!this._CANONICAL_IS_US[group];
    if (displaySystem === 'US') {
      return canonicalIsUS ? n : g.toSI(n);
    }
    return canonicalIsUS ? g.toUS(n) : n;
  },

  /**
   * Convert canonical formula value → display unit for a field.
   */
  canonicalToDisplay(val, group, displaySystem) {
    const g = this.GROUPS[group];
    if (!g || val === '' || val === undefined || isNaN(+val)) return val;
    const n = +val;
    const canonicalIsUS = !!this._CANONICAL_IS_US[group];
    if (displaySystem === 'US') {
      return canonicalIsUS ? n : g.toUS(n);
    }
    return canonicalIsUS ? g.toSI(n) : n;
  },

  /** @deprecated Use displayToCanonical — kept for any direct callers */
  toSI(val, group, displaySystem) {
    return this.displayToCanonical(val, group, displaySystem || this.system);
  },

  fromSI(val, group) {
    return this.canonicalToDisplay(val, group, this.system);
  },

  /**
   * Convert all form values to canonical units before computation.
   * @param {Object} vals - raw form values
   * @param {Object} schema
   * @param {Object} [displayUnits] - map fieldId → 'SI' | 'US' (per input data-display-unit)
   */
  convertFormToSI(vals, schema, displayUnits) {
    const out = Object.assign({}, vals);
    const units = displayUnits || {};
    (schema.inputs || []).forEach(inp => {
      const grp = this.inferGroup(inp);
      if (!grp || out[inp.id] === undefined || out[inp.id] === '') return;
      const displaySys = units[inp.id] || this.system;
      out[inp.id] = this.displayToCanonical(+out[inp.id], grp, displaySys);
    });
    return out;
  },

  /** Collect per-field display systems from a calculator form */
  readDisplayUnits(form, schema) {
    const units = {};
    (schema.inputs || []).forEach(inp => {
      const grp = this.inferGroup(inp);
      if (!grp) return;
      const el = form.elements[inp.id];
      if (el && el.dataset.displayUnit) {
        units[inp.id] = el.dataset.displayUnit;
      }
    });
    return units;
  }
};
