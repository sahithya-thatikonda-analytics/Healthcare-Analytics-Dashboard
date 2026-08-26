# Healthcare Analytics — Python Analysis

## Overview

This folder contains the Python-based healthcare analytics performed using the Synthea healthcare dataset.

The analysis focuses on five major healthcare domains:

1. Patient Utilization
2. Medication Utilization
3. Encounter Utilization
4. Condition Prevalence
5. Observation Utilization

The objective was to identify meaningful patterns in patient healthcare utilization, medication burden and cost, encounter patterns, disease prevalence, and clinical observations.

### Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook

---

# 1. Patient Utilization Analysis

**Notebook:** `Patient Utilization Analysis.ipynb`

## Objective

Analyze how healthcare utilization is distributed across patients and identify characteristics of high-utilization patients.

## Key Analyses

- Patient-level encounter utilization
- Distribution of encounters per patient
- Utilization by age group
- Gender differences in utilization
- Identification of high-utilization patients
- Encounter-type composition among high-utilization patients
- Comparison of high-utilizer activity with overall encounter activity

## High-Utilization Definition

The **90th percentile of patient encounter utilization was 63 encounters**.

Patients with more than 63 encounters were classified as high-utilization patients.

- Total patients: **12,352**
- High-utilization patients: **1,199**
- High-utilization patients: **9.71%**

## Key Findings

- Healthcare utilization increased substantially with age.
- Average encounters increased from **4.59** among patients aged 0–18 to **41.22** among patients aged 60+.
- High utilization was strongly concentrated among older patients.
- When the high-utilizer analysis used a more granular older-age classification, the high-utilizer proportion increased from **0%** among patients aged 0–18 to **34.93%** among patients aged 100+.
- Overall, male patients had a higher high-utilizer proportion than female patients:
  - Female: **8.76%**
  - Male: **10.67%**
- The gender difference became more pronounced among older age groups.
- Among high-utilization patients, outpatient encounters accounted for **31.43%**, compared with **18.15%** in the overall encounter population.
- This represents a **13.28 percentage-point difference** in outpatient encounter share.
- High-utilization patients therefore showed a relatively greater share of outpatient activity than the overall encounter population.

## Main Insight

> **High healthcare utilization is strongly concentrated among older patients, with repeated outpatient interactions contributing substantially to high-utilizer activity.**

---

# 2. Medication Utilization Analysis

**Notebook:** `Medication Utilization Analysis.ipynb`

## Objective

Analyze medication utilization, medication burden, prescription intensity, and medication cost concentration at both the medication and patient levels.

## Dataset Scale

- Medication records before duplicate removal: **431,262**
- Exact duplicates removed: **3**
- Records after duplicate removal: **431,259**
- Unique patients analyzed for medication burden: **9,566**
- Unique medication descriptions: **176**

## Key Analyses

- Medication prescription frequency
- Medication utilization across patients
- Medication cost
- Cost per prescription
- Medication utilization intensity
- Patient-level medication burden
- Medication burden categories
- Medication burden versus prescription frequency
- Medication burden versus medication cost
- High-cost patient identification using IQR
- High medication-burden + high-cost subgroup
- Cost concentration / Pareto analysis
- Medication diversity versus medication spending

## Medication Burden Categories

Patients were categorized as:

| Category | Unique Medications |
|---|---:|
| Low | <5 |
| Moderate | 5–9 |
| Polypharmacy | ≥10 |

Distribution:

| Category | Patients | Percentage |
|---|---:|---:|
| Low | 6,889 | **72.02%** |
| Moderate | 2,349 | **24.56%** |
| Polypharmacy | 328 | **3.43%** |

## Prescription Intensity

Average prescription activity increased substantially with medication burden:

| Category | Average Prescriptions | Average Unique Medications | Prescriptions per Unique Medication |
|---|---:|---:|---:|
| Low | 20.67 | 2.20 | 9.41 |
| Moderate | 82.60 | 6.28 | 13.16 |
| Polypharmacy | 289.16 | 11.69 | 24.73 |

## Key Findings

- Medication burden was strongly associated with prescription frequency.
- Average prescriptions increased from **20.67** in the low-burden group to **289.16** among polypharmacy patients.
- Prescription intensity increased from approximately **9.41 prescriptions per unique medication** in the low-burden group to **24.73** in the polypharmacy group.
- Patients with greater medication diversity tended to have higher prescription frequency and higher total medication cost.
- The correlation between unique medication count and prescription frequency was **r = 0.441**.
- The correlation between medication diversity and total medication cost was approximately **r = 0.52**.
- These correlations indicate association rather than causation.

## Medication Cost

Average medication spending increased substantially with medication burden:

| Category | Mean Medication Cost |
|---|---:|
| Low | 73,465.99 |
| Moderate | 202,523.31 |
| Polypharmacy | 459,695.45 |

## High-Cost + High-Burden Subgroup

Patients meeting both criteria were identified:

- **≥10 unique medications**
- Medication cost > **386,736.58**

Results:

- Patients meeting both criteria: **157**
- Percentage of patients: **1.64%**
- Share of total medication spending: **10.32%**

## Cost Concentration

Medication expenditure was highly concentrated:

- Top **10%** of patients accounted for **44.26%** of medication spending.
- Top **20%** accounted for **64.21%**.
- Approximately **12.42%** of patients accounted for **50%** of total medication spending.

## Main Insight

> **Medication utilization and spending are highly concentrated. Patients with greater medication diversity tend to have higher prescription frequency and medication costs, while a relatively small high-burden/high-cost subgroup accounts for a disproportionately large share of expenditure.**

---

# 3. Encounter Utilization Analysis

**Notebook:** `Encounter Utilization Analysis.ipynb`

## Objective

Analyze healthcare encounter patterns across encounter types, time, patient utilization levels, demographic groups, and repeat utilization.

## Dataset Scale

- Total encounters: **321,528**
- Patients represented in the encounter dataset: **12,330**

## Key Analyses

- Encounter volume by type
- Encounter distribution over time
- Year-over-year encounter changes
- Patient-level encounter utilization
- High-utilization patients
- Utilization concentration
- Encounter intensity tiers
- Encounter type × age group
- Repeat-encounter utilization
- Encounter duration

## Encounter-Type Distribution

| Encounter Type | Count | Percentage |
|---|---:|---:|
| Wellness | 156,219 | **48.59%** |
| Ambulatory | 86,069 | **26.77%** |
| Outpatient | 58,367 | **18.15%** |
| Inpatient | 9,584 | **2.98%** |
| Emergency | 7,233 | **2.25%** |
| Urgent Care | 4,056 | **1.26%** |

## High-Utilization Definition

For this encounter-level analysis, high utilization was defined using the **95th percentile** of patient encounter counts.

- 95th-percentile threshold: **83 encounters**
- High-utilization patients: **614**
- High-utilization patients: **4.98%**
- Encounters generated by high-utilization patients: **103,197**
- Share of all encounters: **32.10%**

High-utilization patients therefore generated approximately **6.45 times their population share** in encounters.

## Utilization Concentration

Patients with more than 25 encounters represented:

- **29.92%** of patients
- **78.11%** of all encounters

This demonstrates strong concentration of healthcare utilization among frequently returning patients.

## Key Findings

- Wellness encounters represented nearly half of all encounters.
- Ambulatory and outpatient encounters were the next largest categories.
- Inpatient, emergency, and urgent-care encounters represented much smaller shares.
- Patient-level encounter utilization was highly right-skewed.
- The maximum recorded patient utilization was **825 encounters**.
- A small group of patients generated a disproportionately large share of total encounters.
- Repeat-encounter patients accounted for nearly all encounter activity.

## Encounter Type × Age Group

The distribution of encounter types varied across age groups.

Examples:

- Wellness was dominant among patients under 18 (**48.42%**).
- Wellness was also dominant among ages 18–34 (**50.58%**).
- Ambulatory encounters dominated the 35–49 group (**47.00%**).
- Ambulatory encounters dominated the 50–64 group (**46.39%**).
- Wellness was dominant among the 65–79 group (**54.95%**).

These age-group results should be interpreted with caution because the number of patients in some older age groups was relatively small.

## Repeat Utilization

- Patients with repeat encounters: **12,054**
- Patients with exactly one encounter: **276**
- Repeat-encounter patients: **97.76%**
- Repeat-encounter patients generated **99.91%** of all encounters.
- Repeat patients averaged **26.65 encounters**.
- The median among repeat patients was **10 encounters**.

## Encounter Duration

High-utilization patients and other patients had the same median encounter duration:

- High utilization: **0.25 hours**
- Other patients: **0.25 hours**

This is approximately **15 minutes**.

The similar median duration suggests that differences in utilization were primarily driven by **encounter frequency rather than typical encounter duration**.

Because the dataset contains extreme encounter-duration values, the median is more representative than the mean for describing typical encounter duration.

## Main Insight

> **Healthcare utilization is highly concentrated among patients with repeated encounters, while encounter frequency—not typical individual encounter duration—is the primary driver of high utilization.**

---

# 4. Condition Prevalence Analysis

**Notebook:** `Condition Prevalence Analysis.ipynb`

## Objective

Analyze condition prevalence, condition burden, persistence, co-occurrence, demographic differences, and temporal patterns.

## Dataset Scale

- Condition records: **114,544**
- Unique patients: **12,165**
- Unique conditions: **180**

## Methodological Approach

Condition prevalence was calculated using **unique patients**, rather than the number of condition records.

Overall prevalence was calculated as:

> **Unique patients with condition ÷ 12,165 × 100**

Age-group prevalence used the number of unique patients represented within each respective age group.

Different age-group classifications were used for different analyses in the notebook. Age-specific prevalence and condition-burden analyses therefore should not be interpreted as using one universal age-group scheme.

## Key Analyses

- Overall condition prevalence
- Condition prevalence by age group
- Condition duration/persistence
- Condition co-occurrence
- Condition prevalence by gender
- Condition burden by gender
- Condition trends over time
- Condition diversity over time
- Condition persistence across years
- Condition burden across age groups
- Year-over-year condition growth

## Most Prevalent Conditions

| Condition / Finding | Patients | Prevalence |
|---|---:|---:|
| Suspected COVID-19 | 9,106 | **74.85%** |
| COVID-19 | 8,820 | **72.50%** |
| Fever | 8,083 | **66.44%** |
| Cough | 6,202 | **50.98%** |
| Obesity | 5,002 | **41.12%** |
| Loss of taste | 4,711 | **38.73%** |
| Prediabetes | 3,917 | **32.20%** |
| Anemia | 3,650 | **30.00%** |
| Fatigue | 3,516 | **28.90%** |
| Hypertension | 3,168 | **26.04%** |

## Condition Burden by Age

Average number of unique conditions increased progressively with age:

| Age Group | Mean Conditions | Median |
|---|---:|---:|
| 0–18 | **2.98** | 2 |
| 19–35 | **3.79** | 2 |
| 36–50 | **4.00** | 3 |
| 51–65 | **5.08** | 4 |
| 66+ | **6.74** | 6 |

This indicates increasing documented condition burden among older age groups.

## Condition Persistence

The notebook examined the duration of resolved conditions and also examined persistence across calendar years.

For resolved-condition duration:

- Resolved condition records with a STOP date: **63,096**
- Records without a STOP date: **51,448**
- Records missing STOP date: **44.92%**

A minimum of **10 resolved episodes per condition** was used when ranking duration to reduce distortion from conditions with very small sample sizes.

For calendar-year persistence, conditions were ranked according to the number of years in which they appeared in the dataset.

Examples included:

- Chronic sinusitis — **108 years**
- History of single seizure — **102 years**
- Seizure disorder — **102 years**
- Obesity — **99 years**
- Appendicitis — **97 years**
- Hypertension — **93 years**
- Anemia — **91 years**

These values represent **documented presence across calendar years in the dataset**, not the continuous duration of disease in an individual patient.

## Condition Trends

The dataset showed a major increase in condition recording in **2020**:

- 2018: **1,182** condition records
- 2019: **3,736** condition records
- 2020: **66,629** condition records
- Unique conditions in 2020: **136**

The large increase in condition records was therefore not simply caused by a large increase in the number of distinct condition types; existing conditions were being recorded much more frequently.

## Condition Co-Occurrence

The strongest condition pairs were heavily influenced by COVID-related conditions:

| Condition Pair | Patients |
|---|---:|
| COVID-19 + Suspected COVID-19 | **8,820** |
| Fever + Suspected COVID-19 | **8,083** |
| COVID-19 + Fever | **7,840** |
| Cough + Suspected COVID-19 | **6,202** |
| COVID-19 + Cough | **6,020** |
| Cough + Fever | **5,513** |

## Main Insight

> **Condition burden increases with age, while COVID-related findings dominate overall prevalence and co-occurrence patterns in this synthetic population. Condition recording also increased sharply in 2020.**

---

# 5. Observation Analysis

**Notebook:** `Observation analysis.ipynb`

## Objective

Analyze the utilization, recording intensity, and measurement distributions of clinical observations.

This phase was intentionally limited to **three distinct analyses**.

---

## Analysis 1 — Observation Utilization

### Question

> Which clinical observations are most frequently recorded, and how extensively are observations distributed across patients?

### Dataset Scale

- Total observations: **1,659,750**
- Patients with observations: **12,352**
- Unique observation types: **201**
- Average observations per patient: **134.37**

Vital signs and laboratory measurements formed major components of the observation dataset.

Several vital-sign measurements were frequently recorded together, including blood pressure, body weight, heart rate, and respiratory rate.

## Main Finding

> **Clinical observation utilization is substantial, with more than 1.65 million observation records distributed across 12,352 patients and 201 observation types.**

---

## Analysis 2 — Observation Recording Intensity

### Question

> Which observation types are repeatedly recorded for patients, particularly among observations with broad patient coverage?

Recording intensity was calculated as:

> **Observation count ÷ number of patients receiving that observation**

The analysis also considered patient coverage so that highly repeated observations with very small patient populations would not automatically be interpreted as broadly utilized clinical measurements.

Several laboratory observations showed repeated measurement patterns, indicating that certain laboratory tests are captured multiple times for the patients receiving them.

## Main Finding

> **Observation recording intensity reflects repeated measurement of clinical variables, while patient coverage provides important context for interpreting whether a frequently repeated observation is broadly utilized or concentrated in a smaller patient population.**

---

## Analysis 3 — Clinical Measurement Distribution

### Question

> What are the typical distributions and variability of commonly recorded clinical measurements?

Of the **1,659,750** observations:

- Numeric values: **1,560,338**
- Non-numeric/missing values: **99,412**
- Selected vital-sign observations analyzed: **313,894**

The selected measurements included:

- Body Weight
- Body Temperature
- Diastolic Blood Pressure
- Heart Rate
- Oxygen Saturation
- Respiratory Rate
- Systolic Blood Pressure

### Descriptive Statistics

| Observation | Mean | Median | SD | Minimum | Maximum |
|---|---:|---:|---:|---:|---:|
| Body Weight | 75.26 | 79.40 | 22.18 | 2.5 | 158.8 |
| Body Temperature | 39.60 | 39.70 | 1.57 | 36.1 | 42.2 |
| Diastolic BP | 80.57 | 80.00 | 7.17 | 67 | 121 |
| Heart Rate | 110.76 | 96.40 | 42.01 | 50 | 200 |
| Oxygen Saturation | 81.93 | 81.90 | 4.26 | 65 | 100 |
| Respiratory Rate | 22.25 | 19.60 | 8.75 | 12 | 40 |
| Systolic BP | 121.65 | 120.00 | 13.99 | 95 | 201 |

## Key Findings

- Heart rate showed the greatest variability among the selected measurements, with an SD of **42.01**.
- Body weight showed substantial variation, with values ranging from **2.5 to 158.8**.
- Blood-pressure measurements showed comparatively concentrated central distributions.
- Oxygen saturation showed a relatively narrow numerical range compared with highly variable measurements such as heart rate.
- Several measurements contained extreme observations or potential statistical outliers.
- Individual boxplots were used because the selected observations have different units and therefore should not be directly compared on a common numerical scale.

## Main Insight

> **Clinical observations differ substantially in their distributions and variability, with repeated vital-sign and laboratory measurements forming major components of the observation dataset.**

---

# Overall Python Analysis — Key Takeaways

Across the five analytical domains, several major patterns emerged:

### 1. Healthcare Utilization Is Concentrated

A relatively small group of patients accounts for a disproportionately large amount of healthcare activity.

### 2. Age Is Strongly Associated With Utilization and Condition Burden

Older patients showed substantially higher encounter utilization and a greater number of documented conditions.

### 3. Medication Burden Is Associated With Prescription Activity and Cost

Patients receiving more distinct medications generally had more prescriptions and higher medication costs.

### 4. Medication Expenditure Is Highly Concentrated

The top 10% of patients by medication cost accounted for **44.26%** of total medication spending.

### 5. Conditions Show Strong Temporal and Co-Occurrence Patterns

COVID-related findings dominated prevalence and co-occurrence, while condition recording increased dramatically in 2020.

### 6. Clinical Observations Are Repeatedly Collected

The observation dataset contains more than **1.65 million records**, with vital signs and laboratory measurements forming major components of observation utilization.

---

# Python Analysis Notebooks

| Notebook | Focus |
|---|---|
| `Patient Utilization Analysis.ipynb` | Patient-level healthcare utilization and high-utilizer analysis |
| `Medication Utilization Analysis.ipynb` | Medication utilization, burden, prescription intensity, and cost |
| `Encounter Utilization Analysis.ipynb` | Encounter patterns, utilization concentration, age groups, and repeat encounters |
| `Condition Prevalence Analysis.ipynb` | Condition prevalence, burden, persistence, trends, and co-occurrence |
| `Observation analysis.ipynb` | Observation utilization, recording intensity, and clinical measurement distributions |

---

# Conclusion

The Python phase provides a structured analytical foundation for the broader **Healthcare Analytics Dashboard** project.

The analyses identify patterns in:

- Patient healthcare utilization
- Medication burden and expenditure
- Healthcare encounter patterns
- Disease prevalence and burden
- Clinical observation utilization and measurement distributions

Together, these analyses provide a data-driven foundation for the subsequent **SQL analytics and Power BI dashboard phases** of the project.