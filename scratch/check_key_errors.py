import sys
sys.path.append('supabase/migrations')
import generate_geri_osteoporosis_mcqs
import random
import json

random.seed(42)

genders_pool = [
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]
female_pool = [
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"}
]

vcf_triggers = ["tripping over a rug", "bending over to pick up a newspaper", "coughing fit", "sneezing", "lifting a bag of groceries"]
fall_drugs_pool = generate_geri_osteoporosis_mcqs.fall_drugs_pool
beers_drugs_pool = generate_geri_osteoporosis_mcqs.beers_drugs_pool
hip_fx_types = generate_geri_osteoporosis_mcqs.hip_fx_types
male_op_causes = generate_geri_osteoporosis_mcqs.male_op_causes

for t_idx, t in enumerate(generate_geri_osteoporosis_mcqs.templates):
    # Let's generate a single mock format_kwargs
    age = random.randint(65, 89)
    age_young = random.randint(40, 48)
    age_male = random.randint(70, 85)
    fp = random.choice(female_pool)
    duration = random.randint(6, 24)
    t_score_val = round(random.uniform(-4.0, -2.6), 1)
    t_osteopenia_val = round(random.uniform(-2.4, -1.1), 1)
    spine_t = round(random.uniform(-4.2, -2.6), 1)
    neck_t = round(random.uniform(-4.0, -2.6), 1)
    exercise_t = round(random.uniform(-2.4, -1.1), 1)
    romo_t = round(random.uniform(-3.5, -4.5), 1)
    risk_factor = "parental history of hip fracture"
    frax_major = round(random.uniform(21.0, 35.0), 1)
    frax_hip = round(random.uniform(3.2, 8.5), 1)
    denosumab_reason = "severe renal impairment (eGFR 18 mL/min/1.73 m2)"
    teri_fractures = random.randint(2, 4)
    teri_years = random.randint(2, 4)
    pred_dose = random.choice([5, 7.5, 10, 15, 20])
    pred_duration = random.randint(3, 6)
    giop_t = round(random.uniform(-3.0, -1.5), 1)
    onj_drug = "alendronate"
    onj_duration = random.randint(3, 8)
    onj_weeks = random.randint(9, 16)
    dental_procedure = "tooth extraction"
    jaw_site = "mandible"
    aff_duration = random.randint(5, 12)
    aff_side = "the left"
    aff_weeks = random.randint(3, 12)
    holiday_duration = random.randint(5, 8)
    post_hip_days = random.randint(5, 21)
    calcium_val = round(random.uniform(8.2, 9.6), 1)
    vitd_val = random.randint(12, 35)
    calcium_intake = 400
    vitd_level = 25
    vitd_low = 6
    ca_low = 7.5
    phos_low = 2.0
    vcf_trigger = "sneezing"
    vcf_level = 8
    vcf_percent = 35
    vcf_level2 = 9
    kyph_weeks = 6
    fall_months = 4
    fall_recurrence = "fell 2 times"
    fall_med_count = 8
    fall_number = "2nd"
    fall_period = 6
    fall_drug_item = random.choice(fall_drugs_pool)
    home_falls = 3
    exercise_falls = 2
    poly_falls = 3
    poly_months = 6
    beers_drug_item = random.choice(beers_drugs_pool)
    sbp_supine = 150
    dbp_supine = 80
    sbp_standing = 120
    dbp_standing = 70
    hip_fx = random.choice(hip_fx_types)
    male_op_cause = "chronic alcohol abuse"

    format_kwargs = {
        "age": age,
        "age_young": age_young,
        "age_male": age_male,
        "gender": fp["gender"],
        "pronoun": fp["pronoun"],
        "pronoun_cap": fp["pronoun_cap"],
        "possessive": fp["possessive"],
        "possessive_cap": fp["possessive_cap"],
        "duration": duration,
        "t_score": t_score_val,
        "t_osteopenia": t_osteopenia_val,
        "spine_t": spine_t,
        "neck_t": neck_t,
        "exercise_t": exercise_t,
        "romo_t": romo_t,
        "risk_factor": risk_factor,
        "frax_major": frax_major,
        "frax_hip": frax_hip,
        "denosumab_reason": denosumab_reason,
        "teri_fractures": teri_fractures,
        "teri_years": teri_years,
        "pred_dose": pred_dose,
        "pred_duration": pred_duration,
        "giop_t": giop_t,
        "onj_drug": onj_drug,
        "onj_duration": onj_duration,
        "onj_weeks": onj_weeks,
        "dental_procedure": dental_procedure,
        "jaw_site": jaw_site,
        "aff_duration": aff_duration,
        "aff_side": aff_side,
        "aff_weeks": aff_weeks,
        "holiday_duration": holiday_duration,
        "post_hip_days": post_hip_days,
        "calcium": calcium_val,
        "vitd": vitd_val,
        "calcium_intake": calcium_intake,
        "vitd_level": vitd_level,
        "vitd_low": vitd_low,
        "ca_low": ca_low,
        "phos_low": phos_low,
        "vcf_trigger": vcf_trigger,
        "vcf_level": vcf_level,
        "vcf_percent": vcf_percent,
        "vcf_level2": vcf_level2,
        "kyph_weeks": kyph_weeks,
        "fall_months": fall_months,
        "fall_recurrence": fall_recurrence,
        "fall_med_count": fall_med_count,
        "fall_number": fall_number,
        "fall_period": fall_period,
        "home_falls": home_falls,
        "exercise_falls": exercise_falls,
        "poly_falls": poly_falls,
        "poly_months": poly_months,
        "sbp_supine": sbp_supine,
        "dbp_supine": dbp_supine,
        "sbp_standing": sbp_standing,
        "dbp_standing": dbp_standing,
        "male_op_cause": male_op_cause,
        "hip_fx_type": hip_fx["desc"],
    }

    if t_idx in [24, 25, 29, 30, 31, 32, 33, 34, 35, 36, 37]:
        gp_used = random.choice(genders_pool)
        format_kwargs["gender"] = gp_used["gender"]
        format_kwargs["pronoun"] = gp_used["pronoun"]
        format_kwargs["pronoun_cap"] = gp_used["pronoun_cap"]
        format_kwargs["possessive"] = gp_used["possessive"]
        format_kwargs["possessive_cap"] = gp_used["possessive_cap"]

    # Now let's try to format and see what KeyErrors we get
    try:
        t["q"].format(**format_kwargs)
    except KeyError as e:
        print(f"Template {t_idx} KeyError: {e}")
