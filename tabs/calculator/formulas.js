/**
 * MediHelp Medical Calculator — Formula Constants
 * Centralized reference values to prevent scattered hardcoded clinical data.
 */
window.CalcFormulas = {
  DOSAGES: {
    epinephrine: { adult_mg: 1, pediatric_mg_per_kg: 0.01 },
    defibrillation: { first_j_per_kg: 2, second_j_per_kg: 4, max_j_per_kg: 10, max_j_adult: 360 },
    tidal_volume: { ml_per_kg_low: 6, ml_per_kg_high: 8 },
    parkland: { multiplier: 4 },
    maintenance_fluid: { first_10: 100, second_10: 50, remainder: 20 },
    iron_deficit: { factor: 0.544, target_hb_default: 15 },
    sodium_correction: { factor_low: 1.6, factor_high: 2.4, glucose_threshold: 400 },
    calcium_correction: { albumin_normal: 4, factor: 0.8 },
    potassium_deficit: { factor: 0.4 },
    bicarbonate_deficit: { factor: 0.5, target_hco3: 24 },
    opioid_mme: {
      morphine: 1,
      oxycodone: 1.5,
      hydrocodone: 1,
      hydromorphone: 5,
      fentanyl_patch_mcg_hr: 2.4,
      codeine: 0.15,
      tramadol: 0.2,
      methadone: 4.7
    }
  },

  THRESHOLDS: {
    bmi: { underweight: 18.5, normal: 25, overweight: 30 },
    qsofa_positive: 2,
    map_low: 65,
    shock_index_high: 0.9,
    pf_ratio_mild: 300,
    pf_ratio_moderate: 200,
    pf_ratio_severe: 100,
    news2_low: 5,
    news2_medium: 7,
    egfr_stages: [90, 60, 45, 30, 15]
  },

  UNITS: {
    weight: ['kg', 'lb'],
    height: ['cm', 'in', 'm'],
    volume: ['mL', 'L'],
    time: ['min', 'hr'],
    concentration: ['mg/mL', 'mcg/mL', 'g/L']
  },

  convert: {
    lbToKg: (lb) => lb * 0.453592,
    kgToLb: (kg) => kg / 0.453592,
    inToCm: (inches) => inches * 2.54,
    cmToIn: (cm) => cm / 2.54,
    mToCm: (m) => m * 100
  }
};
