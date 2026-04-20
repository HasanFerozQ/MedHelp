-- Histology MCQ Migration Script
BEGIN;

-- 1. Ensure Histology Topic exists
INSERT INTO public.topics (semester_id, title, slug, "order")
VALUES (1, 'Histology', 'histology', 10)
ON CONFLICT (semester_id, slug) DO NOTHING;

-- 2. Get the Histology Topic ID
DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE slug = 'histology' LIMIT 1;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stratified squamous keratinized epithelium is best suited for:', '["Secretion", "Absorption", "Protection against abrasion", "Filtration", "Gas exchange"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Simple squamous epithelium is specialized for:', '["Protection", "Absorption", "Rapid diffusion", "Secretion", "Contraction"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Pseudostratified columnar epithelium appears stratified because:', '["All cells reach surface", "Nuclei are at different levels", "Cells lack nuclei", "It contains keratin", "It has multiple layers"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Transitional epithelium is found in:', '["Esophagus", "Trachea", "Urinary bladder", "Skin", "Intestine"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Microvilli primarily function in:', '["Movement", "Absorption", "Secretion", "Protection", "Adhesion"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Cilia are composed of:', '["Actin", "Keratin", "Microtubules", "Collagen", "Elastin"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basement membrane is mainly composed of:', '["Keratin", "Type IV collagen", "Type I collagen", "Elastin", "Hemoglobin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Hemidesmosomes attach:', '["Cell to cell", "Cell to basement membrane", "Cell to lumen", "Cytoplasm to nucleus", "Cell to mucus"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Tight junctions primarily:', '["Allow ion flow", "Prevent paracellular leakage", "Attach cytoskeleton", "Form adhesion plaques", "Form cilia"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Gap junctions allow:', '["Mechanical adhesion", "Passage of ions and small molecules", "Keratinization", "Protein secretion", "Cell division"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The most abundant cell in connective tissue is:', '["Mast cell", "Plasma cell", "Fibroblast", "Neutrophil", "Macrophage"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Dense regular connective tissue is found in:', '["Dermis", "Tendon", "Bone", "Cartilage", "Lymph node"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Reticular fibers are composed of:', '["Type I collagen", "Type II collagen", "Type III collagen", "Elastin", "Keratin"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Elastic fibers allow:', '["Rigidity", "Stretch and recoil", "Mineralization", "Phagocytosis", "Secretion"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Ground substance contains:', '["DNA", "Proteoglycans", "Hemoglobin", "Actin", "Keratin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Mast cells release:', '["Collagen", "Histamine", "Hemoglobin", "Insulin", "Albumin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'White adipose tissue stores:', '["Protein", "Glycogen only", "Lipid", "Calcium", "Iron"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Brown adipose tissue is rich in:', '["Lysosomes", "Mitochondria", "Golgi", "Nucleus only", "Collagen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Brown fat function:', '["Secretion", "Thermogenesis", "Absorption", "Digestion", "Filtration"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Hyaline cartilage contains:', '["Type I collagen", "Type II collagen", "Elastic fibers only", "Bone matrix", "Reticular fibers only"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Chondrocytes reside in:', '["Lacunae", "Canaliculi", "Haversian canals", "Sinusoids", "Crypts"]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Elastic cartilage is found in:', '["Trachea", "Intervertebral disc", "Ear", "Bone", "Tendon"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Fibrocartilage is found in:', '["Nose", "Trachea", "Intervertebral disc", "Ear", "Skin"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Osteoblasts:', '["Resorb bone", "Form bone matrix", "Store calcium", "Destroy cartilage", "Form cartilage"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Osteoclasts are:', '["Mononuclear", "Multinucleated", "Non-functional", "Chondrocytes", "Fibroblasts"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Osteocytes reside in:', '["Canaliculi", "Lacunae", "Haversian canals", "Marrow", "Periosteum"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The structural unit of compact bone:', '["Lacuna", "Osteon", "Trabecula", "Canaliculus", "Matrix"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Skeletal muscle:', '["Non-striated", "Multinucleated", "Single nucleus", "Involuntary", "Branched"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Cardiac muscle:', '["Non-striated", "Branched cells", "Multinucleated peripheral nuclei", "Voluntary", "No junctions"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Smooth muscle:', '["Striated", "Spindle-shaped", "Multinucleated", "Voluntary", "Branched"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Intercalated discs contain:', '["Cilia", "Desmosomes + gap junctions", "Microvilli", "Keratin", "Collagen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Most abundant WBC:', '["Lymphocyte", "Neutrophil", "Monocyte", "Eosinophil", "Basophil"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'RBC function:', '["Immunity", "Clotting", "Oxygen transport", "Hormone production", "Phagocytosis"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Platelets are derived from:', '["RBC", "Megakaryocytes", "Lymphocytes", "Monocytes", "Plasma cells"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Eosinophils increase in:', '["Bacterial infection", "Viral infection", "Parasitic infection", "Trauma", "Anemia"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Exocrine glands secrete:', '["Into blood", "Into ducts", "Into nucleus", "Into cytoplasm", "Into lymph only"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Endocrine glands:', '["Have ducts", "Secrete hormones into blood", "Secrete mucus", "Form keratin", "Produce bile"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Merocrine secretion:', '["Cell destruction", "Vesicle exocytosis", "Apical cytoplasm loss", "Whole cell release", "Diffusion only"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Apocrine secretion involves:', '["Entire cell destruction", "Apical portion release", "Only exocytosis", "Only diffusion", "Nuclear breakdown"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Holocrine secretion:', '["Vesicle only", "Entire cell rupture", "Apical release", "Diffusion", "Transporters"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Lamina propria is:', '["Muscle layer", "Loose connective tissue", "Bone", "Cartilage", "Epithelium"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Keratin is:', '["Lipid", "Structural protein", "Enzyme", "Hormone", "DNA"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Collagen provides:', '["Elasticity", "Tensile strength", "Secretion", "Diffusion", "Motility"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basement membrane function:', '["Contraction", "Support + filtration", "Digestion", "Hormone secretion", "Immunity"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Reticular tissue is abundant in:', '["Skin", "Liver and spleen", "Bone", "Muscle", "Cartilage"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Perichondrium surrounds:', '["Bone", "Cartilage", "Muscle", "Blood vessel", "Nerve"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Endosteum lines:', '["Outer bone", "Inner bone cavity", "Cartilage", "Muscle", "Epithelium"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Canaliculi function:', '["Transport blood", "Connect osteocytes", "Store calcium", "Secrete matrix", "Digest bone"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Goblet cells:', '["Absorb nutrients", "Secrete mucus", "Produce collagen", "Form bone", "Kill bacteria"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basement membrane lies between:', '["Epithelium & connective tissue", "Muscle & bone", "Blood & lymph", "Cartilage & bone", "Nerve & muscle"]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stratified cuboidal epithelium is most commonly found in:', '["Alveoli", "Sweat gland ducts", "Intestinal lining", "Urinary bladder", "Blood vessels"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stratified columnar epithelium is:', '["Common in most organs", "Rare and found in large ducts", "Found only in kidney", "Found in alveoli", "Same as pseudostratified"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stereocilia are:', '["Motile structures", "Modified microvilli", "Made of microtubules", "Present in trachea", "Same as cilia"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stereocilia are found in:', '["Trachea", "Epididymis", "Skin", "Bone", "Kidney"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Loss of cilia function leads to:', '["Increased absorption", "Impaired mucus clearance", "Increased keratin", "Increased secretion", "Better diffusion"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Plasma cells are responsible for:', '["Collagen production", "Antibody secretion", "Phagocytosis", "Histamine release", "Fat storage"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Macrophages originate from:', '["Fibroblasts", "Monocytes", "Lymphocytes", "Mast cells", "RBCs"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Proteoglycans in ground substance mainly:', '["Increase rigidity", "Bind water and resist compression", "Form collagen", "Form elastin", "Carry oxygen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Vitamin C deficiency affects:', '["Keratin", "Collagen synthesis", "Hemoglobin", "DNA", "Lipid"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Reticular fibers provide:', '["Elasticity", "Framework for soft organs", "Bone strength", "Muscle contraction", "Gas exchange"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Articular cartilage lacks:', '["Chondrocytes", "Type II collagen", "Perichondrium", "Proteoglycans", "Water"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Cartilage nutrition occurs via:', '["Blood vessels", "Diffusion", "Lymphatics", "Nerves", "Hormones"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Chondroblasts:', '["Resorb cartilage", "Produce cartilage matrix", "Become osteocytes", "Destroy bone", "Form collagen type I only"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Osteoclast activity increases with:', '["Calcitonin", "Parathyroid hormone", "Vitamin D deficiency", "Estrogen", "Insulin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Woven bone is:', '["Mature bone", "Immature bone", "Cartilage", "Elastic tissue", "Fibrocartilage"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Lamellar bone is:', '["Organized", "Organized", "Cartilage", "Temporary", "Weak"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Intramembranous ossification forms:', '["Long bones", "Flat bones (skull)", "Cartilage", "Tendons", "Ligaments"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Endochondral ossification occurs in:', '["Skull flat bones", "Long bones", "Dermis", "Tendons", "Ligaments"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Sarcomere is:', '["Functional unit of muscle", "Cell membrane", "Nucleus", "Connective tissue", "Organelle"]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A band contains:', '["Actin only", "Myosin + actin overlap", "Myosin only", "No filaments", "DNA"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'I band contains:', '["Myosin", "Actin only", "Collagen", "Elastin", "DNA"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Smooth muscle contraction is regulated by:', '["Troponin", "Calmodulin", "Myoglobin", "Actin only", "Keratin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basophils release:', '["Insulin", "Histamine", "Hemoglobin", "Antibodies", "Collagen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Monocytes become:', '["RBCs", "Macrophages", "Platelets", "Neutrophils", "Eosinophils"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Lymphocytes are primarily involved in:', '["Oxygen transport", "Immunity", "Clotting", "Digestion", "Hormone synthesis"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Platelets function in:', '["Immunity", "Clotting", "Oxygen transport", "Hormone production", "Digestion"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Primary lymphoid organs:', '["Spleen", "Lymph node", "Bone marrow + thymus", "Tonsils", "Peyer patches"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Secondary lymphoid organs:', '["Bone marrow", "Thymus", "Spleen and lymph nodes", "Liver", "Kidney"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Germinal centers are sites of:', '["RBC production", "B cell proliferation", "Platelet formation", "Cartilage growth", "Muscle repair"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Serous cells produce:', '["Mucus", "Watery protein-rich secretion", "Lipid", "Hormones only", "Glycogen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Mucous cells produce:', '["Watery secretion", "Thick mucus", "Hormones", "Collagen", "Hemoglobin"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Mixed glands contain:', '["Only endocrine cells", "Only exocrine cells", "Both serous and mucous cells", "Only ducts", "Only acini"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basal lamina is produced by:', '["Fibroblasts", "Epithelial cells", "RBCs", "Platelets", "Chondrocytes"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Reticular lamina is produced by:', '["Epithelial cells", "Fibroblasts", "Osteoblasts", "Chondrocytes", "Plasma cells"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Glycocalyx is:', '["DNA layer", "Carbohydrate coat on cells", "Lipid membrane", "Protein only", "Cytoskeleton"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Loss of desmosomes leads to:', '["Weak adhesion between cells", "Weak basement membrane", "Loss of blood supply", "Increased absorption", "Increased secretion"]'::jsonb, 0, 'The correct answer is A.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Basement membrane damage affects:', '["Muscle contraction", "Cell attachment", "RBC formation", "Bone growth", "Hormone release"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Increased osteoclast activity leads to:', '["Bone formation", "Bone resorption", "Cartilage formation", "Muscle growth", "Fat deposition"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Excess collagen deposition leads to:', '["Atrophy", "Fibrosis", "Necrosis", "Apoptosis", "Metaplasia"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Defective elastic fibers cause:', '["Rigidity", "Loss of elasticity", "Increased strength", "Bone formation", "Keratinization"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Simple cuboidal epithelium lines:', '["Alveoli", "Kidney tubules", "Skin", "Trachea", "Esophagus"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Simple columnar epithelium lines:', '["Skin", "Intestine", "Bone", "Tendon", "Cartilage"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Stratified squamous non-keratinized epithelium lines:', '["Skin", "Esophagus", "Trachea", "Bladder", "Kidney"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Endothelium lines:', '["GI tract", "Blood vessels", "Skin", "Cartilage", "Bone"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Mesothelium lines:', '["Blood vessels", "Serous cavities", "Skin", "Bone", "Muscle"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Adipose tissue secretes:', '["Insulin", "Leptin", "Thyroxine", "Hemoglobin", "Collagen"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Bone marrow produces:', '["Muscle", "Blood cells", "Cartilage", "Epithelium", "Nerves"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Tendon injury heals slowly because:', '["Too many cells", "Poor blood supply", "Too much collagen", "Too elastic", "Too soft"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Cartilage heals poorly because:', '["Excess blood", "No blood supply", "Too much collagen", "Too many cells", "Too rigid"]'::jsonb, 1, 'The correct answer is B.')
    ON CONFLICT DO NOTHING;

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Histology mainly studies:', '["Organs", "Systems", "Tissues", "Molecules", "DNA"]'::jsonb, 2, 'The correct answer is C.')
    ON CONFLICT DO NOTHING;

END $$;

COMMIT;