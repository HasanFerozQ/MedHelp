const nutritionCards = [
  {
    "q": "What are the fat-soluble vitamins?",
    "a": "<b>A, D, E, K</b> (absorbed with lipids, stored in liver and adipose tissue)."
  },
  {
    "q": "What are the water-soluble vitamins?",
    "a": "<b>B-complex (B1–B12) and C</b> (not stored in large amounts, excreted in urine)."
  },
  {
    "q": "Which vitamin deficiency causes night blindness and xerophthalmia?",
    "a": "<b>Vitamin A</b> deficiency."
  },
  {
    "q": "What is the function of Vitamin A (retinol)?",
    "a": "Visual pigments (rhodopsin), epithelial differentiation, gene transcription via RAR/RXR."
  },
  {
    "q": "What is the toxicity of excess Vitamin A?",
    "a": "Teratogenic (cleft palate, cardiac defects), pseudotumor cerebri, <b>hepatotoxicity</b>."
  },
  {
    "q": "What is the active form of Vitamin D?",
    "a": "1,25-dihydroxycholecalciferol (<b>calcitriol</b>)."
  },
  {
    "q": "What does Vitamin D deficiency cause in children vs adults?",
    "a": "<ul><li><b>Children:</b> Rickets</li><li><b>Adults:</b> Osteomalacia.</li></ul>"
  },
  {
    "q": "What is the function of Vitamin E?",
    "a": "Antioxidant (protects membranes from free radical damage)."
  },
  {
    "q": "What is the classic presentation of Vitamin E deficiency?",
    "a": "Spinocerebellar degeneration, hemolytic anemia, acanthocytosis."
  },
  {
    "q": "What is the function of Vitamin K?",
    "a": "γ-carboxylation of clotting factors II, VII, IX, X and proteins C & S."
  },
  {
    "q": "What causes Vitamin K deficiency in newborns?",
    "a": "Sterile gut + low stores → hemorrhagic disease of the newborn."
  },
  {
    "q": "Which vitamin is a cofactor for carboxylation reactions?",
    "a": "<b><b>Biotin</b> (B7)</b>."
  },
  {
    "q": "Which vitamin deficiency causes Wernicke-<b>Korsakoff syndrome</b>?",
    "a": "<b><b>Thiamine</b> (B1)</b> — confusion, ataxia, ophthalmoplegia."
  },
  {
    "q": "Which vitamin deficiency causes beriberi?",
    "a": "<b><b>Thiamine</b> (B1)</b> — wet (cardiac) or dry (neurologic)."
  },
  {
    "q": "Which vitamin deficiency causes pellagra?",
    "a": "<b><b>Niacin</b> (B3)</b> — 4 Ds: Dermatitis, Diarrhea, Dementia, Death."
  },
  {
    "q": "What causes pellagra besides dietary deficiency?",
    "a": "Hartnup disease, carcinoid syndrome, <b>isoniazid</b>."
  },
  {
    "q": "Which vitamin deficiency causes cheilosis, glossitis, and seborrheic dermatitis?",
    "a": "<b><b>Riboflavin</b> (B2)</b> deficiency."
  },
  {
    "q": "Which vitamin is required for transamination reactions?",
    "a": "<b>Pyridoxine (B6)</b>."
  },
  {
    "q": "Which drugs can cause B6 deficiency?",
    "a": "<b>Isoniazid</b>, <b>hydralazine</b>, <b>penicillamine</b>."
  },
  {
    "q": "What is the function of Vitamin B12?",
    "a": "Methylmalonyl-CoA mutase and methionine synthase (homocysteine → methionine)."
  },
  {
    "q": "What causes B12 deficiency besides diet?",
    "a": "<b>Pernicious anemia</b> (<b>intrinsic factor</b> deficiency), terminal ileum resection, <b>metformin</b>."
  },
  {
    "q": "What is the most common cause of folate deficiency?",
    "a": "Poor diet, alcoholism, pregnancy, <b>methotrexate</b>."
  },
  {
    "q": "Why is folate supplementation critical in pregnancy?",
    "a": "Prevents neural tube defects."
  },
  {
    "q": "What is the function of Vitamin C?",
    "a": "Antioxidant, collagen hydroxylation (prolyl/lysyl hydroxylase), iron absorption."
  },
  {
    "q": "What is the classic presentation of scurvy?",
    "a": "Perifollicular hemorrhages, corkscrew hairs, bleeding gums, poor wound healing."
  },
  {
    "q": "Which mineral is a component of glutathione peroxidase?",
    "a": "<b>Selenium</b>."
  },
  {
    "q": "What is the function of Zinc?",
    "a": "Cofactor for &gt;300 enzymes, wound healing, taste/smell, immune function."
  },
  {
    "q": "What is acrodermatitis enteropathica?",
    "a": "<b>Zinc deficiency</b> — periorificial dermatitis, alopecia, diarrhea."
  },
  {
    "q": "What is the function of Copper?",
    "a": "Component of lysyl oxidase (collagen cross-linking), <b>cytochrome c</b> oxidase."
  },
  {
    "q": "What is <b>Menkes disease</b>?",
    "a": "Defective copper absorption (ATP7A) → kinky hair, hypotonia, seizures."
  },
  {
    "q": "What is <b>Wilson disease</b>?",
    "a": "Defective copper excretion (ATP7B) → Kayser-Fleischer rings, <b>cirrhosis</b>, <b>basal ganglia</b> damage."
  },
  {
    "q": "What is the function of Iodine?",
    "a": "Thyroid hormone synthesis (T3/T4)."
  },
  {
    "q": "What is the classic sign of Iodine deficiency?",
    "a": "Goiter and cretinism in severe cases."
  },
  {
    "q": "What is the function of Chromium?",
    "a": "Enhances insulin action (glucose tolerance factor)."
  },
  {
    "q": "What is the function of Fluoride?",
    "a": "Strengthens tooth enamel (hydroxyapatite → fluorapatite)."
  },
  {
    "q": "What are the clinical features of <b>Kwashiorkor</b>?",
    "a": "Edema, fatty liver, skin lesions, normal weight for height (protein deficiency)."
  },
  {
    "q": "What are the clinical features of <b>Marasmus</b>?",
    "a": "Severe muscle wasting, loss of subcutaneous fat, no edema (total calorie deficiency)."
  },
  {
    "q": "What is the difference between <b>marasmus</b> and <b>kwashiorkor</b>?",
    "a": "<ul><li>Marasmus = total calorie deficit</li><li>Kwashiorkor = protein deficit with adequate calories.</li></ul>"
  },
  {
    "q": "What is <b>refeeding syndrome</b>?",
    "a": "Hypophosphatemia, hypokalemia, hypomagnesemia after refeeding malnourished patients."
  },
  {
    "q": "What is the most common nutritional deficiency worldwide?",
    "a": "<b>Iron deficiency</b>."
  },
  {
    "q": "What is the daily caloric requirement for an average adult?",
    "a": "Approximately 25–30 kcal/kg/day."
  },
  {
    "q": "What is the protein requirement for a healthy adult?",
    "a": "0.8 g/kg/day (higher in stress, pregnancy, growth)."
  },
  {
    "q": "What are essential fatty acids?",
    "a": "Linoleic acid (ω-6) and α-linolenic acid (ω-3)."
  },
  {
    "q": "What is the function of medium-chain triglycerides (MCTs)?",
    "a": "Absorbed directly into <b>portal vein</b>, useful in malabsorption syndromes."
  },
  {
    "q": "What is the recommended dietary allowance (RDA) for Vitamin A in pregnancy?",
    "a": "Avoid excess (teratogenic); use β-carotene instead."
  },
  {
    "q": "What is the role of fiber in the diet?",
    "a": "Soluble: lowers cholesterol; Insoluble: increases stool bulk."
  },
  {
    "q": "What is the difference between complete and incomplete proteins?",
    "a": "Complete proteins contain <b>all</b> essential amino acids (animal sources, soy, quinoa)."
  },
  {
    "q": "What is parenteral nutrition and its major complication?",
    "a": "TPN; risk of line infection, cholestasis, and <b>refeeding syndrome</b>."
  },
  {
    "q": "What is the first-line treatment for obesity?",
    "a": "Lifestyle modification (diet + exercise)."
  },
  {
    "q": "Which drug is used for weight loss that inhibits fat absorption?",
    "a": "<b>Orlistat</b> (pancreatic lipase inhibitor)."
  },
  {
    "q": "What is metabolic syndrome?",
    "a": "Central obesity + ≥2 of: hypertension, hyperglycemia, hypertriglyceridemia, low HDL."
  },
  {
    "q": "What is the <b>DASH diet</b> used for?",
    "a": "<b>Dietary Approaches to Stop Hypertension</b> — rich in fruits, vegetables, low-fat dairy, low sodium."
  },
  {
    "q": "What is the <b>Mediterranean diet</b> associated with?",
    "a": "Reduced cardiovascular risk and improved longevity."
  },
  {
    "q": "What is the glycemic index?",
    "a": "Measure of how quickly a food raises blood glucose."
  },
  {
    "q": "What is the difference between simple and complex carbohydrates?",
    "a": "Simple: rapid absorption (sugars); Complex: slower digestion (starches, fiber)."
  },
  {
    "q": "What is lactose intolerance due to?",
    "a": "Lactase deficiency → osmotic diarrhea, bloating."
  },
  {
    "q": "What is <b>celiac disease</b>?",
    "a": "Autoimmune reaction to gluten (gliadin) → villous atrophy in small intestine."
  },
  {
    "q": "What is the diagnostic test for <b>celiac disease</b>?",
    "a": "Anti-tissue transglutaminase (tTG) <b>IgA</b> + duodenal biopsy."
  },
  {
    "q": "What is the treatment for <b>celiac disease</b>?",
    "a": "Strict lifelong gluten-free diet."
  },
  {
    "q": "What is <b>dumping syndrome</b>?",
    "a": "Rapid gastric emptying after gastrectomy → osmotic diarrhea and reactive hypoglycemia."
  },
  {
    "q": "What are the fat-soluble vitamin deficiencies after bariatric surgery?",
    "a": "A, D, E, K (due to malabsorption)."
  },
  {
    "q": "What is the most common micronutrient deficiency after Roux-en-Y gastric bypass?",
    "a": "<b>Vitamin B12 and Iron</b>."
  },
  {
    "q": "What is the role of probiotics?",
    "a": "Live microorganisms that confer health benefits when consumed in adequate amounts."
  },
  {
    "q": "What is the function of prebiotics?",
    "a": "Non-digestible fibers that promote growth of beneficial gut bacteria."
  },
  {
    "q": "What is the recommended daily fiber intake?",
    "a": "25 g/day for women, 38 g/day for men."
  },
  {
    "q": "What is the WHO recommendation for free sugars?",
    "a": "Less than 10% of total energy intake (ideally &lt;5%)."
  },
  {
    "q": "What is the function of omega-3 fatty acids?",
    "a": "Anti-inflammatory, reduce triglycerides, improve endothelial function."
  },
  {
    "q": "What is the difference between DHA and EPA?",
    "a": "Both omega-3; DHA important for brain/retina, EPA more anti-inflammatory."
  },
  {
    "q": "What is the protein-sparing effect of carbohydrates?",
    "a": "Carbs prevent breakdown of protein for gluconeogenesis."
  },
  {
    "q": "What is the respiratory quotient (RQ) for pure carbohydrate oxidation?",
    "a": "RQ = 1.0"
  },
  {
    "q": "What is the RQ for pure fat oxidation?",
    "a": "RQ ≈ 0.7"
  },
  {
    "q": "What is the clinical use of indirect calorimetry?",
    "a": "Measures resting energy expenditure (REE)."
  },
  {
    "q": "What is the Harris-Benedict equation used for?",
    "a": "Estimating basal metabolic rate (BMR)."
  },
  {
    "q": "What is the stress factor in nutritional requirements during critical illness?",
    "a": "Increase caloric needs by 20–50% depending on severity."
  },
  {
    "q": "What is the preferred route of nutrition in critically ill patients?",
    "a": "Enteral nutrition (if gut works) over parenteral."
  },
  {
    "q": "What is the major complication of overfeeding in TPN?",
    "a": "Hyperglycemia, hepatic steatosis, increased CO₂ production."
  },
  {
    "q": "What electrolyte abnormality is classic in <b>refeeding syndrome</b>?",
    "a": "<b>Hypophosphatemia</b>."
  },
  {
    "q": "What is the treatment for <b>refeeding syndrome</b>?",
    "a": "Slow refeeding, monitor and replace phosphate, potassium, magnesium."
  },
  {
    "q": "What is the definition of obesity (BMI)?",
    "a": "BMI ≥ 30 kg/m²."
  },
  {
    "q": "What is sarcopenic obesity?",
    "a": "Loss of muscle mass with increased fat mass (common in elderly)."
  },
  {
    "q": "What is the role of leptin?",
    "a": "Satiety hormone produced by adipocytes; signals to hypothalamus."
  },
  {
    "q": "What is the role of ghrelin?",
    "a": "Hunger hormone produced by stomach; increases before meals."
  },
  {
    "q": "Which bariatric surgery has the best long-term weight loss?",
    "a": "Roux-en-Y gastric bypass (malabsorptive + restrictive)."
  },
  {
    "q": "What is the most common nutritional deficiency in alcoholics?",
    "a": "<b><b>Thiamine</b> (B1)</b>."
  },
  {
    "q": "What is the <b>Wernicke encephalopathy</b> triad?",
    "a": "Confusion, ataxia, ophthalmoplegia."
  },
  {
    "q": "What is the treatment for <b>Wernicke encephalopathy</b>?",
    "a": "High-dose IV <b>thiamine</b> before glucose."
  },
  {
    "q": "What is the function of chromium in nutrition?",
    "a": "Enhances insulin sensitivity."
  },
  {
    "q": "What is the function of molybdenum?",
    "a": "Cofactor for xanthine oxidase and sulfite oxidase."
  },
  {
    "q": "What is the recommended sodium intake?",
    "a": "&lt; 2,300 mg/day (ideally &lt;1,500 mg for hypertensives)."
  },
  {
    "q": "What is the <b>DASH diet</b> emphasis?",
    "a": "High potassium, magnesium, calcium, fiber; low sodium and saturated fat."
  },
  {
    "q": "What is the <b>Mediterranean diet</b> key components?",
    "a": "Olive oil, <b>fish</b>, nuts, fruits, vegetables, moderate red wine."
  },
  {
    "q": "A malnourished patient is started on TPN. Day 2 he develops seizures and muscle weakness. What is the most likely cause?",
    "a": "<b>Refeeding syndrome</b> — hypophosphatemia (shift into cells for <b>ATP</b> synthesis)."
  },
  {
    "q": "What electrolyte abnormalities define <b>refeeding syndrome</b>?",
    "a": "Hypophosphatemia, hypokalemia, hypomagnesemia, and fluid overload."
  },
  {
    "q": "Why must <b>thiamine</b> be given before glucose in alcoholics?",
    "a": "Glucose infusion can precipitate <b>Wernicke encephalopathy</b> in <b>thiamine</b>-deficient patients."
  },
  {
    "q": "A patient with short bowel syndrome develops night blindness and dry skin. Which vitamin is deficient?",
    "a": "<b>Vitamin A</b> (fat-soluble vitamin malabsorption)."
  },
  {
    "q": "A patient on long-term parenteral nutrition develops cholestasis and bone pain. What deficiency is likely?",
    "a": "<b>Vitamin D</b> and/or copper deficiency."
  },
  {
    "q": "What is the most common micronutrient deficiency after Roux-en-Y gastric bypass?",
    "a": "<b>Iron and Vitamin B12</b>."
  },
  {
    "q": "Why does gastric bypass cause B12 deficiency?",
    "a": "Loss of <b>intrinsic factor</b>-producing parietal cells + reduced gastric acid."
  },
  {
    "q": "A patient with chronic pancreatitis has steatorrhea and bleeding gums. Which vitamins are likely deficient?",
    "a": "Fat-soluble vitamins (especially <b>Vitamin K</b> and <b>Vitamin C</b> if diet is poor)."
  },
  {
    "q": "What is the mechanism of <b>orlistat</b>?",
    "a": "Pancreatic and gastric lipase inhibitor → reduced dietary fat absorption."
  },
  {
    "q": "What are the major side effects of <b>orlistat</b>?",
    "a": "Steatorrhea, fecal incontinence, fat-soluble vitamin deficiencies."
  },
  {
    "q": "Which medication for weight loss can cause acute pancreatitis?",
    "a": "Semaglutide / Liraglutide (GLP-1 agonists)."
  },
  {
    "q": "What is the preferred nutritional support route in critically ill patients with a functioning gut?",
    "a": "<b>Enteral nutrition</b> (maintains gut barrier function)."
  },
  {
    "q": "What is the major risk of overfeeding in ICU patients on TPN?",
    "a": "Hyperglycemia, hepatic steatosis, increased CO₂ production (respiratory failure risk)."
  },
  {
    "q": "A patient with <b>celiac disease</b> develops dermatitis herpetiformis. What is the treatment?",
    "a": "Strict gluten-free diet + dapsone."
  },
  {
    "q": "What is the pathognomonic biopsy finding in <b>celiac disease</b>?",
    "a": "Villous atrophy, crypt hyperplasia, increased intraepithelial lymphocytes."
  },
  {
    "q": "A patient with Crohn’s disease develops megaloblastic anemia. Which vitamin deficiency is most likely?",
    "a": "<b>Vitamin B12</b> (terminal ileum involvement)."
  },
  {
    "q": "What is the difference between <b>kwashiorkor</b> and <b>marasmus</b> on physical exam?",
    "a": "<ul><li><b>Kwashiorkor:</b> edema + fatty liver.</li><li><b>Marasmus:</b> severe wasting, no edema.</li></ul>"
  },
  {
    "q": "What is the classic hair finding in <b>kwashiorkor</b>?",
    "a": "Flag sign (alternating dark and light bands)."
  },
  {
    "q": "What is the role of medium-chain triglycerides (MCTs) in malabsorption syndromes?",
    "a": "Absorbed directly into <b>portal vein</b> without needing micelle formation."
  },
  {
    "q": "A patient with <b>cystic fibrosis</b> has failure to thrive. What nutritional intervention is critical?",
    "a": "Pancreatic enzyme replacement + high-calorie diet with fat-soluble vitamin supplementation."
  },
  {
    "q": "What is the mechanism of <b>dumping syndrome</b> after gastrectomy?",
    "a": "Rapid emptying of hyperosmolar food into small intestine → fluid shift and reactive hypoglycemia."
  },
  {
    "q": "Early vs late <b>dumping syndrome</b> timing?",
    "a": "<ul><li><b>Early:</b> &lt;30 min (GI symptoms).</li><li><b>Late:</b> 1–3 hours (hypoglycemia).</li></ul>"
  },
  {
    "q": "What is the treatment for <b>dumping syndrome</b>?",
    "a": "Small frequent meals, separate liquids from solids, complex carbohydrates."
  },
  {
    "q": "A patient with chronic alcoholism has macrocytic anemia and hypersegmented <b>neutrophils</b>. Which vitamin deficiency?",
    "a": "<b>Folate</b> (more common than B12 in alcoholics)."
  },
  {
    "q": "What is the most common nutritional deficiency in the United States?",
    "a": "<b>Vitamin D deficiency</b>."
  },
  {
    "q": "Which population is at highest risk for Vitamin D deficiency?",
    "a": "Elderly, dark-skinned individuals, obese, limited sun exposure."
  },
  {
    "q": "What lab findings confirm Vitamin D deficiency?",
    "a": "Low 25-OH vitamin D, elevated PTH, low/normal calcium."
  },
  {
    "q": "A vegan patient develops paresthesias and ataxia. What deficiency is most likely?",
    "a": "<b>Vitamin B12</b> (only found in animal products)."
  },
  {
    "q": "What is the best initial test for suspected B12 deficiency?",
    "a": "Serum B12 level + methylmalonic acid (elevated in B12 deficiency)."
  },
  {
    "q": "What is the function of chromium in glucose metabolism?",
    "a": "Component of glucose tolerance factor; enhances insulin signaling."
  },
  {
    "q": "What is the classic triad of <b>Wernicke encephalopathy</b>?",
    "a": "Ophthalmoplegia, ataxia, confusion (not <b>all</b> present in every case)."
  },
  {
    "q": "What is Korsakoff psychosis?",
    "a": "Irreversible amnesia and confabulation following untreated <b>Wernicke encephalopathy</b>."
  },
  {
    "q": "Which trace element deficiency causes acrodermatitis enteropathica?",
    "a": "<b>Zinc</b>."
  },
  {
    "q": "A patient with <b>Wilson disease</b> is started on treatment. What is the mechanism of <b>penicillamine</b>?",
    "a": "Copper chelator."
  },
  {
    "q": "What is the preferred maintenance therapy for <b>Wilson disease</b>?",
    "a": "<b>Zinc</b> (blocks intestinal copper absorption)."
  },
  {
    "q": "What is the most common inherited disorder of iron metabolism?",
    "a": "<b>Hereditary <b>hemochromatosis</b></b> (HFE C282Y mutation)."
  },
  {
    "q": "What is the treatment for hereditary <b>hemochromatosis</b>?",
    "a": "Therapeutic phlebotomy."
  },
  {
    "q": "A patient with chronic kidney disease develops secondary hyperparathyroidism. What nutritional deficiency contributes?",
    "a": "<b>Vitamin D</b> deficiency (impaired 1α-hydroxylation in kidney)."
  },
  {
    "q": "What is the role of carnitine in nutrition?",
    "a": "Transports long-chain fatty acids into mitochondria for β-oxidation."
  },
  {
    "q": "When is carnitine supplementation useful?",
    "a": "In carnitine deficiency syndromes or long-term TPN patients."
  },
  {
    "q": "What is the respiratory quotient (RQ) value indicating pure carbohydrate metabolism?",
    "a": "RQ = 1.0"
  },
  {
    "q": "What is the RQ for fat oxidation?",
    "a": "RQ ≈ 0.7"
  },
  {
    "q": "What does a high RQ (&gt;1.0) indicate?",
    "a": "Lipogenesis (overfeeding with carbohydrates)."
  },
  {
    "q": "What is the indication for parenteral nutrition?",
    "a": "Intestinal failure when enteral route is not possible for &gt;7–10 days."
  },
  {
    "q": "What is the major complication of long-term TPN?",
    "a": "Intestinal failure-associated liver disease (IFALD) and central line infections."
  },
  {
    "q": "A patient with anorexia nervosa is refed too aggressively. What is the most dangerous complication?",
    "a": "<b>Refeeding syndrome</b> leading to fatal hypophosphatemia and cardiac arrhythmias."
  },
  {
    "q": "What is the best initial management for suspected <b>refeeding syndrome</b>?",
    "a": "Slow refeeding, electrolyte replacement (especially phosphate), close monitoring."
  },
  {
    "q": "What is sarcopenic obesity?",
    "a": "Increased fat mass with decreased muscle mass (common in elderly and after bariatric surgery)."
  },
  {
    "q": "What hormone is elevated in obesity and contributes to leptin resistance?",
    "a": "Leptin (but receptors become resistant)."
  },
  {
    "q": "What is the mechanism of liraglutide/semaglutide in weight loss?",
    "a": "GLP-1 receptor agonists → increased satiety, delayed gastric emptying, reduced appetite."
  },
  {
    "q": "What is the role of fiber in preventing colon cancer?",
    "a": "Increases stool bulk, reduces transit time, binds potential carcinogens."
  },
  {
    "q": "What is the difference between soluble and insoluble fiber?",
    "a": "<ul><li><b>Soluble:</b> lowers cholesterol and blood glucose.</li><li><b>Insoluble:</b> increases stool bulk and prevents constipation.</li></ul>"
  },
  {
    "q": "What is the recommended daily protein intake for a critically ill patient?",
    "a": "1.2–2.0 g/kg/day (higher in burns, trauma)."
  },
  {
    "q": "What is the preferred enteral formula for patients with renal failure?",
    "a": "Low-electrolyte, high-calorie renal formulas."
  },
  {
    "q": "What is the advantage of polymeric vs elemental enteral formulas?",
    "a": "Polymeric: cheaper, better tolerated in patients with intact digestion."
  },
  {
    "q": "A patient with chylothorax is placed on a special diet. What type of diet is used?",
    "a": "Low-fat diet with medium-chain triglycerides (MCTs)."
  },
  {
    "q": "What is the nutritional management of <b>phenylketonuria</b> (<b>PKU</b>)?",
    "a": "Phenylalanine-restricted diet + tyrosine supplementation."
  },
  {
    "q": "What is the long-term risk if <b>PKU</b> is untreated?",
    "a": "Intellectual disability, seizures, musty odor."
  }
];
module.exports = { nutritionCards };
