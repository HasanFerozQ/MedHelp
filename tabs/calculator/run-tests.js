#!/usr/bin/env node
/**
 * MediHelp Calculator Test Runner
 * Usage: npm run test:calculators
 */
const fs = require('fs');
const path = require('path');
const vm = require('vm');

const ROOT = path.join(__dirname, '..', '..');
const CALC = path.join(ROOT, 'tabs', 'calculator');

function loadScript(file, ctx) {
  const code = fs.readFileSync(path.join(CALC, file), 'utf8');
  vm.runInContext(code, ctx, { filename: file });
}

function bootstrap() {
  const ctx = {
    window: {},
    console,
    Math,
    Date,
    JSON,
    parseInt,
    parseFloat,
    isNaN,
    isFinite,
    Array,
    Object,
    String,
    Number,
    Boolean,
    RegExp,
    Error
  };
  ctx.window = ctx;
  ctx.globalThis = ctx;
  vm.createContext(ctx);

  ctx.localStorage = {
    _data: { mh_unit_system: 'SI' },
    getItem(k) { return this._data[k] ?? null; },
    setItem(k, v) { this._data[k] = v; }
  };

  const order = [
    'formulas.js',
    'clinical-data.js',
    'i18n.js',
    'registry.js',
    'schemas.js',
    'schemas-extra.js',
    'schemas-remaining.js',
    'schemas-new.js',
    'schemas-new2.js',
    'units.js',
    'compute.js',
    'compute-remaining.js',
    'compute-new.js',
    'compute-new2.js',
    'clinical-grade.js'
  ];
  order.forEach(f => loadScript(f, ctx));
  return ctx;
}

function runTests() {
  const ctx = bootstrap();
  const { CalcCompute, CalcRegistry, CalcSchemas, CalcUnits } = ctx;
  const cases = JSON.parse(fs.readFileSync(path.join(CALC, 'test-cases.json'), 'utf8'));
  let passed = 0, failed = 0, skipped = 0;
  const failures = [];
  const allIds = CalcRegistry.calculators.filter(c => c.implemented).map(c => c.id);
  const testedIds = new Set();

  console.log('\n=== MediHelp Calculator Test Suite ===\n');
  console.log('Implemented calculators:', allIds.length);
  console.log('Explicit test cases:', cases.cases.length);
  console.log('');

  cases.cases.forEach((tc, i) => {
    testedIds.add(tc.id);
    const schema = CalcSchemas[tc.id] || CalcSchemas[CalcCompute._aliases?.[tc.id]];
    const inputs = (schema && tc.displayUnits)
      ? CalcUnits.convertFormToSI(tc.inputs, schema, tc.displayUnits)
      : tc.inputs;
    const result = CalcCompute.compute(tc.id, inputs);
    if (tc.expectErrorContains) {
      const err = String(result.error || '');
      const okErr = err.toLowerCase().includes(String(tc.expectErrorContains).toLowerCase());
      if (okErr) { passed++; console.log('  PASS  ' + tc.id + (tc.note ? ' — ' + tc.note : '')); }
      else {
        failed++;
        failures.push({ tc, result, reason: 'Expected error containing "' + tc.expectErrorContains + '", got "' + err + '"' });
        console.log('  FAIL  ' + tc.id);
      }
      return;
    }
    if (result.error) {
      failed++;
      failures.push({ tc, reason: 'Error: ' + result.error });
      return;
    }
    let ok = true;
    if (tc.expectPrimaryContains) {
      ok = (result.primary || '').toLowerCase().includes(String(tc.expectPrimaryContains).toLowerCase());
    }
    if (ok && tc.expectChip) {
      ok = result.chip === tc.expectChip;
    }
    if (ok && tc.expectInterpretationContains) {
      ok = (result.interpretation || '').toLowerCase().includes(tc.expectInterpretationContains.toLowerCase());
    }
    if (ok) { passed++; console.log('  PASS  ' + tc.id + (tc.note ? ' — ' + tc.note : '')); }
    else {
      failed++;
      failures.push({ tc, result, reason: 'Expected primary contains "' + tc.expectPrimaryContains + '", chip ' + tc.expectChip + '; got "' + result.primary + '", chip ' + result.chip });
      console.log('  FAIL  ' + tc.id);
    }
  });

  const untested = allIds.filter(id => !testedIds.has(id));
  console.log('\n--- Smoke test (no explicit case) ---');
  untested.forEach(id => {
    try {
      if (typeof CalcCompute[id] === 'function' || CalcCompute._aliases?.[id]) {
        const r = CalcCompute.compute(id, {});
        if (r && !r.error) { console.log('  SMOKE ' + id); skipped++; }
        else { console.log('  OK    ' + id + ' (needs inputs)'); skipped++; }
      } else {
        failed++;
        failures.push({ tc: { id }, reason: 'No compute function' });
        console.log('  FAIL  ' + id + ' — missing compute');
      }
    } catch (e) {
      failed++;
      failures.push({ tc: { id }, reason: e.message });
      console.log('  FAIL  ' + id + ' — ' + e.message);
    }
  });

  console.log('\n=== Results ===');
  console.log('Passed:', passed);
  console.log('Failed:', failed);
  console.log('Untested IDs needing manual cases:', untested.length);
  if (failures.length) {
    console.log('\nFailures:');
    failures.slice(0, 15).forEach(f => {
      console.log(' -', f.tc.id + ':', f.reason);
      if (f.result) console.log('   primary:', f.result.primary, '| chip:', f.result.chip);
    });
    if (failures.length > 15) console.log(' ... and', failures.length - 15, 'more');
  }
  console.log('');
  process.exit(failed > 0 ? 1 : 0);
}

runTests();
