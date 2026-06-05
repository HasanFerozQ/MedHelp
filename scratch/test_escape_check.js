// Test escaping in javascript file
const TEST = [
  { q: "test", a: "$\\text{Sensitivity}$" },
  { q: "test2", a: "$\\\text{Sensitivity}$" },
  { q: "test3", a: "$\\\\text{Sensitivity}$" },
  { q: "test4", a: "$\\\\\\\text{Sensitivity}$" },
  { q: "test5", a: "$\\\\\\\\text{Sensitivity}$" }
];
