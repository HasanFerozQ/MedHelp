const fs = require('fs');
const path = require('path');
const vm = require('vm');
const CALC = __dirname;
const code = (file) => fs.readFileSync(path.join(CALC, file), 'utf8');
const ctx = { window: {}, console, Math, Date, JSON, parseInt, parseFloat, isNaN, isFinite, Array, Object, String, Number, Boolean, RegExp, Error };
ctx.window = ctx;
ctx.globalThis = ctx;
vm.createContext(ctx);
const order = ['formulas.js','clinical-data.js','i18n.js','registry.js','schemas.js','schemas-extra.js','schemas-remaining.js','schemas-new.js','schemas-new2.js','units.js','compute.js','compute-remaining.js','compute-new.js','compute-new2.js','clinical-grade.js'];
order.forEach((f) => vm.runInContext(code(f), ctx, { filename: f }));
const CalcRegistry = ctx.CalcRegistry;
const cases = JSON.parse(fs.readFileSync(path.join(CALC,'test-cases.json'),'utf8')).cases;
const allIds = CalcRegistry.calculators.filter((c) => c.implemented).map((c) => c.id).sort();
const tested = new Set(cases.map((tc) => tc.id));
const untested = allIds.filter((id) => !tested.has(id));
function buildDefaultInput(schema) {
  const inputs = {};
  if (!schema || !schema.inputs) return inputs;
  schema.inputs.forEach((field) => {
    if (field.type === 'number') {
      if (field.default !== undefined) inputs[field.id] = field.default;
      else if (field.unit === 'kg' || field.unit === 'cm' || field.unit === 'mmHg' || field.unit === 'g/dL' || field.unit === 'mg/dL' || field.unit === 'mEq/L') inputs[field.id] = 1;
      else inputs[field.id] = field.min !== undefined ? field.min : 1;
    } else if (field.type === 'toggle') {
      inputs[field.id] = false;
    } else if (field.type === 'select') {
      inputs[field.id] = field.default !== undefined ? field.default : field.options?.[0]?.v;
    } else {
      inputs[field.id] = field.default !== undefined ? field.default : '';
    }
  });
  return inputs;
}
function normalizePrimary(primary) {
  return String(primary).replace(/\s+/g, ' ').trim();
}
const output = [];
untested.forEach((id) => {
  const schema = ctx.CalcSchemas[id] || ctx.CalcSchemas[ctx.CalcCompute._aliases?.[id]];
  const inputs = buildDefaultInput(schema);
  try {
    const result = ctx.CalcCompute.compute(id, inputs);
    if (result && result.error) {
      output.push({ id, inputs, expectErrorContains: result.error });
    } else {
      const primary = normalizePrimary(result.primary || '');
      const chip = result.chip || 'normal';
      output.push({ id, inputs, expectPrimaryContains: primary, expectChip: chip });
    }
  } catch (e) {
    output.push({ id, error: e.message, inputs });
  }
});
const outPath = path.join(CALC, 'untested-testcases-generated.json');
fs.writeFileSync(outPath, JSON.stringify(output, null, 2), 'utf8');
console.log('Wrote', output.length, 'test candidates to', outPath);
