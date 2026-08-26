# Healthcare Analytics Dataset

This folder contains the synthetic healthcare datasets used in the **Python analysis phase** of the Healthcare Analytics Dashboard project.

The datasets are generated from the **Synthea Synthetic Patient Population Generator** and represent longitudinal patient healthcare records. The files are stored as separate CSV tables and can be linked together using patient, encounter, and clinical identifiers.

The dataset supports analysis of:

- Patient demographics
- Healthcare encounters
- Medical conditions
- Medication utilization
- Clinical observations
- Patient allergies
- Healthcare costs and utilization patterns

---

# 1. Dataset Overview

The Python analysis uses the following datasets:

| Dataset | File | Primary Purpose |
|---|---|---|
| Patients | `patients.csv` | Patient demographics and socioeconomic information |
| Encounters | `encounters.csv` | Healthcare visits and encounters |
| Conditions | `conditions.csv` | Diagnosed medical conditions |
| Medications | `medications.csv` | Medication prescriptions and utilization |
| Observations | `observations.csv` | Clinical measurements and laboratory observations |
| Allergies | `allergies.csv` | Patient allergy records |

The datasets are related primarily through the `PATIENT` identifier.

Healthcare events can also be connected through the `ENCOUNTER` identifier.

---

# 2. Patients Dataset

## File

`patients.csv`

## Purpose

The Patients dataset contains demographic, geographic, and socioeconomic information about individual patients.

Each record represents a patient and provides the basic patient-level information used to connect other healthcare datasets.

This dataset acts as the main patient reference table for the analysis.

## Important Fields

| Field | Description |
|---|---|
| `Id` | Unique identifier for the patient |
| `BIRTHDATE` | Patient's date of birth |
| `DEATHDATE` | Patient's date of death, when available |
| `SSN` | Synthetic Social Security Number |
| `DRIVERS` | Synthetic driver's license identifier |
| `PASSPORT` | Synthetic passport identifier |
| `PREFIX` | Patient name prefix |
| `FIRST` | Patient first name |
| `LAST` | Patient last name |
| `SUFFIX` | Patient name suffix |
| `MAIDEN` | Maiden name, when available |
| `MARITAL` | Marital status |
| `RACE` | Patient race |
| `ETHNICITY` | Patient ethnicity |
| `GENDER` | Patient gender |
| `BIRTHPLACE` | Patient birthplace |
| `ADDRESS` | Patient address |
| `CITY` | Patient city |
| `STATE` | Patient state |
| `COUNTY` | Patient county |
| `FIPS` | Geographic FIPS code |
| `ZIP` | ZIP/postal code |
| `LAT` | Latitude of the patient's location |
| `LON` | Longitude of the patient's location |
| `HEALTHCARE_EXPENSES` | Cumulative healthcare expenses |
| `HEALTHCARE_COVERAGE` | Healthcare coverage information |
| `INCOME` | Patient income |

## Analytical Use

The Patients dataset is useful for:

- Demographic analysis
- Age-group analysis
- Gender-based analysis
- Geographic analysis
- Patient segmentation
- Healthcare utilization comparisons
- Identifying high-utilization patient groups

The dataset is linked to other clinical datasets through the patient identifier.

---

# 3. Encounters Dataset

## File

`encounters.csv`

## Purpose

The Encounters dataset records healthcare interactions between patients and healthcare providers.

An encounter can represent different types of healthcare activity, such as outpatient visits, emergency visits, inpatient encounters, wellness visits, or other healthcare interactions.

This dataset provides the foundation for understanding healthcare utilization.

## Important Fields

| Field | Description |
|---|---|
| `Id` | Unique identifier for the encounter |
| `START` | Encounter start date/time |
| `STOP` | Encounter end date/time |
| `PATIENT` | Identifier linking the encounter to a patient |
| `ORGANIZATION` | Healthcare organization associated with the encounter |
| `PROVIDER` | Healthcare provider associated with the encounter |
| `PAYER` | Insurance payer associated with the encounter |
| `ENCOUNTERCLASS` | Classification/type of encounter |
| `CODE` | Clinical or billing code associated with the encounter |
| `DESCRIPTION` | Description of the encounter |
| `BASE_ENCOUNTER_COST` | Base cost of the encounter |
| `TOTAL_CLAIM_COST` | Total claim cost |
| `PAYER_COVERAGE` | Amount covered by the payer |
| `REASONCODE` | Code representing the reason for the encounter |
| `REASONDESCRIPTION` | Description of the reason for the encounter |

## Analytical Use

The Encounters dataset can be used to analyze:

- Healthcare utilization
- Encounter volume
- Encounter type distribution
- Emergency and inpatient utilization
- Repeat healthcare encounters
- Encounter concentration across patients
- Healthcare costs
- Patient-level utilization patterns

It can also be joined with patients, conditions, medications, and observations to provide clinical context around healthcare encounters.

---

# 4. Conditions Dataset

## File

`conditions.csv`

## Purpose

The Conditions dataset contains medical conditions diagnosed or recorded for patients over time.

Each record represents a condition associated with a patient and, where available, a healthcare encounter.

The dataset provides information about disease prevalence, disease burden, and longitudinal condition patterns.

## Important Fields

| Field | Description |
|---|---|
| `START` | Date when the condition was recorded or began |
| `STOP` | Date when the condition ended, when available |
| `PATIENT` | Identifier linking the condition to a patient |
| `ENCOUNTER` | Identifier linking the condition to a healthcare encounter |
| `CODE` | Clinical condition code |
| `DESCRIPTION` | Description of the medical condition |

## Analytical Use

The Conditions dataset can be used to analyze:

- Disease prevalence
- Condition frequency
- Patient disease burden
- Chronic versus acute condition patterns
- Condition trends over time
- Conditions affecting different patient groups
- Co-occurring medical conditions

The condition records can be connected with encounters and patient demographics to understand disease patterns in relation to healthcare utilization.

---

# 5. Medications Dataset

## File

`medications.csv`

## Purpose

The Medications dataset contains medication prescription and treatment records for patients.

It provides information about medications prescribed to patients, treatment periods, medication costs, dispensing activity, and associated conditions.

## Important Fields

| Field | Description |
|---|---|
| `START` | Medication start date |
| `STOP` | Medication end date |
| `PATIENT` | Identifier linking the medication to a patient |
| `PAYER` | Insurance payer associated with the medication |
| `ENCOUNTER` | Healthcare encounter associated with the medication |
| `CODE` | Medication code |
| `DESCRIPTION` | Medication name or description |
| `BASE_COST` | Base cost of the medication |
| `PAYER_COVERAGE` | Amount covered by the payer |
| `DISPENSES` | Number of medication dispensations |
| `TOTALCOST` | Total medication cost |
| `REASONCODE` | Condition/reason code associated with the medication |
| `REASONDESCRIPTION` | Description of the reason for the medication |

## Analytical Use

The Medications dataset can be used to study:

- Medication utilization
- Prescription volume
- Number of distinct medications per patient
- Medication burden
- Medication treatment duration
- Prescription intensity
- Medication expenditure
- Cost concentration among patients
- Relationship between medication burden and healthcare utilization

Medication records can be linked with patient, encounter, and condition information to provide additional clinical and utilization context.

---

# 6. Observations Dataset

## File

`observations.csv`

## Purpose

The Observations dataset contains clinical measurements and laboratory observations recorded for patients over time.

It includes both routine clinical measurements and laboratory-related observations.

Examples include:

- Body weight
- Body temperature
- Heart rate
- Respiratory rate
- Systolic blood pressure
- Diastolic blood pressure
- Oxygen saturation
- Hemoglobin
- Glucose
- Creatinine
- Sodium
- Potassium
- Liver function measurements
- Other laboratory measurements

## Fields

| Field | Description |
|---|---|
| `DATE` | Date on which the observation was recorded |
| `PATIENT` | Identifier linking the observation to a patient |
| `ENCOUNTER` | Healthcare encounter associated with the observation |
| `CODE` | Clinical observation code |
| `DESCRIPTION` | Name/description of the clinical measurement |
| `VALUE` | Recorded measurement value |
| `UNITS` | Unit associated with the measurement |
| `TYPE` | Type of observation/value |

## Analytical Use

The Observations dataset supports analysis of:

- Observation utilization
- Frequency of clinical measurements
- Number of observations per patient
- Recording intensity of different measurements
- Distribution of clinical measurements
- Vital sign utilization
- Laboratory testing patterns
- Repeated clinical monitoring

During the Python analysis, the observation dataset contained a large number of clinical records and multiple observation types.

The analysis examined both:

1. **How frequently different observations were recorded**
2. **How intensely different observations were recorded among patients who received them**

This distinction is important because an observation may have fewer total records but still be recorded repeatedly for a smaller group of patients.

---

# 7. Allergies Dataset

## File

`allergies.csv`

## Purpose

The Allergies dataset contains information about allergies recorded for patients.

Allergy records can be associated with a patient and, where available, an encounter.

## Important Fields

| Field | Description |
|---|---|
| `START` | Date when the allergy was recorded or became active |
| `STOP` | Date when the allergy ended, when available |
| `PATIENT` | Identifier linking the allergy to a patient |
| `ENCOUNTER` | Associated healthcare encounter |
| `CODE` | Allergy code |
| `SYSTEM` | Coding system used for the allergy |
| `DESCRIPTION` | Description of the allergy |
| `TYPE` | Type of allergy record |
| `CATEGORY` | Allergy category |
| `REACTION1` | First recorded reaction |
| `DESCRIPTION1` | Description of the first reaction |
| `SEVERITY1` | Severity of the first reaction |
| `REACTION2` | Second recorded reaction, when available |
| `DESCRIPTION2` | Description of the second reaction |
| `SEVERITY2` | Severity of the second reaction |

## Analytical Use

The Allergies dataset can be used to analyze:

- Allergy prevalence
- Common allergens
- Allergy categories
- Recorded reactions
- Reaction severity
- Patient-level allergy burden

Although the allergies dataset is part of the project data collection, it was not one of the five main analytical phases completed in the Python analysis.

---

# 8. Relationships Between Datasets

The datasets can be connected using shared identifiers.

## Patient-Level Relationship

The `PATIENT` field connects clinical records to individual patients.

For example:

```text
patients.csv
      │
      │ PATIENT / Id
      ▼
encounters.csv
      │
      ├──────────────► conditions.csv
      │
      ├──────────────► medications.csv
      │
      └──────────────► observations.csv
```

# 9. Dataset Role in the Python Analysis

The datasets provide the underlying data for the five major analytical phases completed during the Python analysis.

### 1. Patient Utilization Analysis

**Primary dataset:** `patients.csv`  
**Supporting dataset:** `encounters.csv`

Used to analyze:

- Patient demographics
- Patient-level healthcare utilization
- Encounter frequency
- High-utilization patients
- Utilization patterns across demographic groups

### 2. Medication Utilization Analysis

**Primary dataset:** `medications.csv`  
**Supporting datasets:** `patients.csv`, `conditions.csv`, `encounters.csv`

Used to analyze:

- Medication utilization
- Medication burden
- Prescription intensity
- Medication diversity
- Medication expenditure
- Cost concentration
- High-burden and high-cost patients

### 3. Encounter Utilization Analysis

**Primary dataset:** `encounters.csv`  
**Supporting dataset:** `patients.csv`

Used to analyze:

- Encounter volume
- Encounter type distribution
- Patient-level encounter utilization
- High-utilization patients
- Repeat encounters
- Encounter concentration
- Encounter patterns across age groups

### 4. Condition Prevalence Analysis

**Primary dataset:** `conditions.csv`  
**Supporting datasets:** `patients.csv`, `encounters.csv`

Used to analyze:

- Condition prevalence
- Patient condition burden
- Condition persistence
- Condition co-occurrence
- Condition patterns across demographic groups
- Condition trends over time

### 5. Observation Analysis

**Primary dataset:** `observations.csv`  
**Supporting datasets:** `patients.csv`, `encounters.csv`

Used to analyze:

- Observation utilization
- Frequently recorded observations
- Observation recording intensity
- Patient observation coverage
- Clinical measurement distributions
- Vital-sign and laboratory observation patterns

---

# 10. Data Characteristics

The datasets contain synthetic longitudinal healthcare records and include a combination of demographic, administrative, clinical, temporal, and financial information.

The data contains different variable types, including:

- **Categorical variables** — gender, race, encounter type, condition, medication, etc.
- **Numerical variables** — costs, clinical measurements, utilization counts, and other quantitative values.
- **Date and datetime variables** — birth dates, encounter dates, medication periods, condition periods, and observation dates.
- **Identifiers** — patient, encounter, provider, organization, payer, and clinical codes.
- **Clinical variables** — diagnoses, medications, allergies, laboratory measurements, and vital signs.
- **Financial variables** — healthcare expenses, encounter costs, medication costs, payer coverage, and related measures.

The datasets represent longitudinal records, allowing patient healthcare activity to be examined over time.

---

# 11. Data Preparation

The CSV datasets are loaded into Python using **Pandas** and prepared for analysis through a series of data-quality and transformation steps.

Typical preparation steps include:

- Loading the CSV files
- Inspecting dataset dimensions and structure
- Reviewing column names and data types
- Converting date fields into appropriate datetime formats
- Checking for missing values
- Checking for duplicate records
- Identifying unique patients and clinical entities
- Standardizing fields required for analysis
- Creating derived variables where required
- Aggregating records to patient-level or clinical-level measures
- Filtering records according to the requirements of individual analyses

The original CSV datasets are retained in the `data` folder and are used as input data for the Python notebooks.

Analytical transformations are performed within the notebooks rather than modifying the original source CSV files.

---

# 12. Data Privacy and Synthetic Data

The datasets used in this project are **synthetic healthcare data** generated using Synthea.

They do not represent real patient records or actual clinical encounters.

The datasets are used for:

- Educational purposes
- Healthcare analytics practice
- Python data analysis
- Portfolio development
- Demonstration of healthcare data workflows
- Development of the Healthcare Analytics Dashboard

Although the datasets contain fields that resemble personally identifiable information, the records are synthetically generated.

Therefore, the results of the analyses should be interpreted as findings from a **synthetic healthcare population** and should not be considered representative of real-world patient populations or clinical outcomes.

---

# 13. Source

The datasets are derived from:

**Synthea — Synthetic Patient Population Generator**

Synthea is used to generate realistic but synthetic longitudinal healthcare records.

The dataset provides multiple interconnected healthcare domains, including:

- Patient demographics
- Healthcare encounters
- Medical conditions
- Medications
- Clinical observations
- Allergies
- Healthcare costs

These datasets provide the underlying data foundation for the **Healthcare Analytics Dashboard** project and its Python-based healthcare analytics.

For more information about Synthea, see:

https://synthetichealth.github.io/synthea/