import json
import os
import shutil

# Target directory
base_dir = r"C:\Users\Hasan-Pc\Desktop\MedHelp"

# Create mock icd10_cpt_codes.json (~20 items for testing)
mock_codes = [
    {"code": "J45.51", "description": "Severe persistent asthma with acute exacerbation", "type": "ICD10", "category": "Respiratory"},
    {"code": "E11.9", "description": "Type 2 diabetes mellitus without complications", "type": "ICD10", "category": "Endocrine"},
    {"code": "I10", "description": "Essential (primary) hypertension", "type": "ICD10", "category": "Circulatory"},
    {"code": "J01.90", "description": "Acute sinusitis, unspecified", "type": "ICD10", "category": "Respiratory"},
    {"code": "L20.9", "description": "Atopic dermatitis, unspecified (Eczema)", "type": "ICD10", "category": "Dermatology"},
    {"code": "L20.83", "description": "Flexural eczema", "type": "ICD10", "category": "Dermatology"},
    {"code": "99213", "description": "Office or other outpatient visit, established patient, low complexity", "type": "CPT", "category": "Evaluation & Management"},
    {"code": "99214", "description": "Office or other outpatient visit, established patient, moderate complexity", "type": "CPT", "category": "Evaluation & Management"},
    {"code": "80053", "description": "Comprehensive metabolic panel", "type": "CPT", "category": "Pathology and Laboratory"},
    {"code": "36415", "description": "Collection of venous blood by venipuncture", "type": "CPT", "category": "Surgery"},
    {"code": "70450", "description": "CT head or brain without contrast", "type": "CPT", "category": "Radiology"},
    {"code": "TC", "description": "Technical Component", "type": "MODIFIER", "category": "Modifier"},
    {"code": "26", "description": "Professional Component", "type": "MODIFIER", "category": "Modifier"}
]

data_dir = os.path.join(base_dir, "data")
os.makedirs(data_dir, exist_ok=True)
with open(os.path.join(data_dir, "icd10_cpt_codes.json"), "w") as f:
    json.dump(mock_codes, f, indent=2)

# Create mock cpt_medicare_prices.json
mock_prices = {
    "99213": { "description": "Office visit, low complexity", "non_facility_price": 92.45, "facility_price": 68.32 },
    "99214": { "description": "Office visit, moderate complexity", "non_facility_price": 131.25, "facility_price": 98.50 },
    "80053": { "description": "Comprehensive metabolic panel", "non_facility_price": 14.50, "facility_price": 14.50 },
    "36415": { "description": "Venipuncture", "non_facility_price": 3.00, "facility_price": 3.00 },
    "70450": { "description": "CT head without contrast", "non_facility_price": 125.00, "facility_price": 85.00 }
}
with open(os.path.join(data_dir, "cpt_medicare_prices.json"), "w") as f:
    json.dump(mock_prices, f, indent=2)

# Handle Icons
image_path = r"C:\Users\Hasan-Pc\.gemini\antigravity\brain\210a8dbb-f828-41bb-a82c-960f49eb1f69\icon128_1775239513570.png"
icons_dir = os.path.join(base_dir, "icons")
os.makedirs(icons_dir, exist_ok=True)

try:
    shutil.copy(image_path, os.path.join(icons_dir, "icon16.png"))
    shutil.copy(image_path, os.path.join(icons_dir, "icon48.png"))
    shutil.copy(image_path, os.path.join(icons_dir, "icon128.png"))
    print("Mocks and icons generated successfully.")
except Exception as e:
    print("Error processing image:", e)
