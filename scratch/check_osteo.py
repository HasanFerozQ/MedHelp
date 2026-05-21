import sys
sys.path.append('supabase/migrations')
import generate_geri_osteoporosis_mcqs

print('Number of templates:', len(generate_geri_osteoporosis_mcqs.templates))
for i, t in enumerate(generate_geri_osteoporosis_mcqs.templates):
    # Print the first 50 chars of the question
    print(f"Template {i}: {t['q'][:80]}...")
