# Healthcare SQL Analytics Portfolio

A collection of three healthcare analytics projects developed using **PostgreSQL and SQL** on synthetic healthcare data.

These projects demonstrate SQL application across **hospital operations, population health, patient risk stratification, readmission analysis, and longitudinal healthcare utilization**.

---

## Projects Overview

| # | Project | Primary Focus | Analytical Grain |
|---|---|---|---|
| 1 | **Hospital Operations Dashboard** | Hospital utilization, operational KPIs, readmissions, ED burden, inpatient efficiency, and care gaps | Operational / KPI level |
| 2 | **Population Health Risk Registry** | Patient risk stratification, chronic disease burden, medication burden, utilization, and care gaps | One row per patient |
| 3 | **Healthcare Readmission & Utilization Intelligence System** | Encounter sequencing, rolling utilization, readmissions, rapid returns, and utilization intensity | One row per encounter |

---

# Project 1 — Hospital Operations Dashboard

## Project Goal

Build a healthcare operational analytics dashboard to monitor:

- Hospital utilization
- Patient activity
- Readmission patterns
- Emergency department burden
- Care gaps
- Inpatient efficiency
- High-utilizer populations

The project uses PostgreSQL analytical pipelines.

## Business Objective

Provide leadership with:

- Operational KPIs
- Utilization trends
- Quality indicators
- Patient engagement metrics

to support:

- Hospital management
- Resource planning
- Population health monitoring
- Quality improvement

## Tables Used

| Table | Purpose |
|---|---|
| `encounters` | Utilization and operational metrics |
| `patients` | Patient demographics |
| `organizations` | Workload attribution |

## Main KPIs

| KPI | Business Meaning |
|---|---|
| Monthly Encounters | Operational workload trend |
| Active Patients | Patient engagement |
| Readmission Rate | Quality metric |
| Average LOS | Inpatient efficiency |
| ED Utilization | Acute-care burden |
| High Utilizers | High-cost utilization |
| Care Gaps | Disengaged patients |
| Top Organization Workload | Workload concentration |

## SQL Concepts Used

- CTEs
- `GROUP BY`
- `COUNT(DISTINCT ...)`
- `CASE`
- `LEAD()`
- `DATE_TRUNC()`
- `MAX()`
- `MIN()`
- `HAVING`
- `CROSS JOIN`
- `INTERVAL`
- Temporal calculations

## Analytical Workflow

Raw Encounter Data  
↓  
KPI Aggregation Pipelines  
↓  
Operational KPI Tables  
↓  
Dashboard Assembly  
↓  
Executive Reporting Dataset

## KPI Logic

### Monthly Encounters

Counts total encounters per month.

**Purpose:** Operational workload monitoring.

### Active Patients

Counts unique patients with encounters during each month.

**Purpose:** Patient engagement tracking.

### Readmission Rate

Uses `LEAD()` and 30-day interval logic to identify subsequent encounters within the defined readmission window.

**Purpose:** Quality and performance measurement.

### Average Length of Stay

Calculates inpatient stay duration.

**Purpose:** Inpatient operational efficiency.

### ED Utilization

Filters encounters where `encounterclass = 'emergency'`.

**Purpose:** Acute-care utilization monitoring.

### High Utilizers

Identifies patients with **15 or more encounters**.

**Purpose:** High-cost population detection.

### Care Gaps

Calculates the number of days since the patient's latest encounter.

**Purpose:** Disengagement monitoring.

## Data Quality Issues

The analysis identified:

- Unrealistic historical dates
- Very old synthetic timelines
- Abnormal longitudinal durations

### Mitigation

- Observation-window filtering
- Temporal validation
- Plausibility checks

## Analytical Learnings

This project demonstrated:

- KPI engineering
- Analytical decomposition
- Healthcare operational analytics
- Longitudinal timeline analysis
- Modular SQL architecture
- Dashboard-ready dataset generation
- Analytical validation thinking

## Healthcare Relevance

This type of dashboard is relevant to:

- Hospital operations
- Payer analytics
- Population health
- Utilization management
- Care-management programs
- Quality reporting systems

## Future Extensions

Potential extensions include:

- Payer segmentation
- Provider analytics
- Diagnosis trends
- Medication adherence analytics
- Regional analysis
- Operational forecasting

## Final Output

Generated a dashboard-ready healthcare operational dataset containing:

- Monthly trends
- Utilization metrics
- Quality KPIs
- Care-management indicators
- Operational summaries

---

# Project 2 — Population Health Risk Registry

## Project Goal

Build a patient-level healthcare risk registry to identify:

- High-risk patients
- High utilizers
- Polypharmacy burden
- Care-gap populations
- Chronic disease burden

The project uses PostgreSQL analytical pipelines.

## Business Objective

Support:

- Care-management programs
- Population health teams
- Payer analytics
- Chronic disease intervention
- Utilization reduction strategies

through proactive patient risk stratification.

## Analytical Grain

**One row = one patient**

This was the primary architectural decision.

All KPI pipelines were designed at the patient level.

## Tables Used

| Table | Purpose |
|---|---|
| `patients` | Demographics |
| `encounters` | Utilization analytics |
| `medications` | Medication burden |
| `conditions` | Chronic disease burden |

## Main KPIs

| KPI | Business Meaning |
|---|---|
| Total Encounters | Healthcare utilization burden |
| Total Conditions | Disease burden |
| Total Medications | Medication burden |
| ED Visits | Acute-care utilization |
| Inpatient Visits | Hospitalization burden |
| Readmissions | Repeated utilization |
| Days Since Last Encounter | Care engagement |
| Utilization Category | Operational utilization level |
| Medication Burden Category | Polypharmacy severity |
| Care Gap Category | Disengagement severity |
| Overall Risk Category | Integrated patient risk |

## SQL Concepts Used

- Multiple CTEs
- `LEFT JOIN`
- `COUNT(DISTINCT ...)`
- `CASE`
- `LEAD()`
- `INTERVAL`
- `MAX()`
- `COALESCE()`
- `AGE()`
- `GROUP BY`
- Patient-level aggregation

## Analytical Architecture

Patients Table  
↓  
Independent KPI Pipelines  
↓  
Patient-Level KPI Outputs  
↓  
Risk Segmentation Logic  
↓  
Final Population Health Registry

## Independent KPI Pipelines

| Pipeline | Purpose |
|---|---|
| `encounter_kpi` | Utilization burden |
| `conditions_kpi` | Chronic disease burden |
| `medications_kpi` | Medication burden |
| `ed_kpi` | Emergency utilization |
| `inpatient_visits_kpi` | Hospitalization burden |
| `readmission_analysis` | Temporal readmission detection |
| `readmission_kpi` | Patient readmission counts |
| `care_gap_analysis` | Engagement timeline |
| `care_gap_kpi` | Care-gap segmentation |

## Temporal Analytics

Temporal logic was implemented for:

- Readmissions
- Care gaps
- Age
- Latest encounter tracking

Key SQL functions:

- `LEAD()`
- `INTERVAL`
- `CURRENT_DATE`
- `MAX()`
- `AGE()`

## Risk Segmentation Logic

### Utilization Category

| Encounter Count | Category |
|---:|---|
| `>= 15` | High Utilizer |
| `5–14` | Moderate Utilizer |
| `< 5` | Low Utilizer |

### Medication Burden Category

| Medication Count | Category |
|---:|---|
| `>= 10` | High Polypharmacy |
| `5–9` | Moderate Polypharmacy |
| `< 5` | Low Polypharmacy |

### Care Gap Category

| Days Since Last Encounter | Category |
|---:|---|
| `> 365` | Severe Gap |
| `181–365` | Moderate Gap |
| `<= 180` | Active Patient |

### Overall Risk Category

High-risk patients were identified using:

- Encounters `>= 15`
- Conditions `>= 5`
- Medications `>= 10`

Moderate-risk logic used:

- Utilization burden
- OR
- Medication burden

## Observation Window

Encounter-based KPIs were filtered using the observation window beginning:

`2015-01-01`

### Purpose

- Avoid unrealistic historical inflation
- Improve analytical realism
- Standardize utilization timelines

## Data Quality Observations

The synthetic Synthea data produced:

- Extremely old encounter histories
- Unrealistic patient ages
- Inflated longitudinal utilization

### Mitigation

- Observation-window filtering
- Age filtering
- Temporal validation

## Analytical Learnings

This project demonstrated:

- Patient-level registry architecture
- Healthcare risk stratification
- Temporal healthcare analytics
- Modular KPI engineering
- `LEFT JOIN` registry design
- Longitudinal utilization analysis
- Operational categorization systems
- Analytical decomposition

## Healthcare Relevance

This type of registry is relevant to:

| Domain | Usage |
|---|---|
| Payer Analytics | High-cost patient identification |
| Population Health | Chronic disease outreach |
| Care Management | Intervention prioritization |
| Hospital Systems | Readmission reduction |
| Value-Based Care | Utilization optimization |

## Future Extensions

Potential extensions include:

- Payer segmentation
- Risk scoring models
- Medication adherence analytics
- Provider attribution
- Chronic disease cohorts
- Mortality prediction

## Final Output

Generated a patient-level healthcare risk registry containing:

- Utilization burden
- Disease burden
- Medication burden
- Readmission analytics
- Care-gap indicators
- Operational risk segmentation
- Population health risk categories

---

# Project 3 — Healthcare Readmission & Utilization Intelligence System

## Project Goal

Build an encounter-level longitudinal healthcare analytics system to analyze:

- Readmissions
- Rapid return visits
- Utilization intensity
- Encounter sequencing
- Rolling utilization burden
- Patient instability patterns

The project uses PostgreSQL temporal analytics pipelines.

## Business Objective

Support:

- Hospital quality analytics
- Utilization management
- Payer surveillance systems
- Readmission reduction initiatives
- Care-transition monitoring
- Population health intelligence

through longitudinal encounter analytics.

## Analytical Grain

**One row = one encounter**

This was the primary architectural decision.

All KPI pipelines were designed at the encounter level.

## Tables Used

| Table | Purpose |
|---|---|
| `encounters` | Temporal utilization analytics |
| `patients` | Demographic enrichment |

## Main KPIs

| KPI | Business Meaning |
|---|---|
| Previous Encounter Date | Prior utilization tracking |
| Next Encounter Date | Future utilization tracking |
| Days Since Previous Encounter | Utilization spacing |
| Days Until Next Encounter | Return utilization timing |
| Rolling 180-Day Encounters | Short-term utilization burden |
| Rolling 365-Day Encounters | Annual utilization burden |
| Inpatient Visit Count | Hospitalization burden |
| ED Visit Count | Emergency utilization |
| Readmission Flag | 30-day return utilization |
| Rapid Return Flag | 7-day rapid return |
| Utilization Velocity | Encounter intensity over time |
| Utilization Risk Category | Utilization severity segmentation |

## SQL Concepts Used

- `LAG()`
- `LEAD()`
- Self joins
- `INTERVAL`
- `CASE`
- `LEFT JOIN`
- `COALESCE()`
- Window functions
- `GROUP BY`
- Rolling temporal windows
- Temporal feature engineering

## Analytical Architecture

Encounter Timeline Layer  
↓  
Temporal Navigation Layer  
↓  
Rolling Utilization Pipelines  
↓  
Readmission Intelligence  
↓  
Encounter-Level Risk Registry

## Encounter Timeline Layer

The foundational CTE was:

`encounter_timeline_analysis`

It generated:

- Encounter sequencing
- Previous encounter tracking
- Future encounter tracking
- Temporal encounter gaps

This layer became reusable temporal intelligence infrastructure.

## Previous Encounter Analysis

`LAG()` was used to identify previous healthcare encounters.

This enabled calculation of:

`days_since_previous_encounter`

**Purpose:** Utilization spacing analysis.

## Next Encounter Analysis

`LEAD()` was used to identify future healthcare encounters.

This enabled calculation of:

`days_until_next_encounter`

**Purpose:**

- Readmission analysis
- Rapid-return analysis
- Longitudinal utilization surveillance

## Encounter Gap Metrics

| Metric | Meaning |
|---|---|
| `days_since_previous_encounter` | Prior encounter gap |
| `days_until_next_encounter` | Future encounter gap |

## Rolling Utilization Analytics

### Rolling 180-Day Utilization

Measures healthcare utilization burden within the previous 180 days.

**Purpose:**

- Short-term utilization intensity
- Recent healthcare burden

### Rolling 365-Day Utilization

Measures healthcare utilization burden within the previous 365 days.

**Purpose:**

- Annual utilization surveillance
- Chronic utilization monitoring

## Readmission Intelligence

### 30-Day Readmission Flag

An encounter was flagged when:

`1 <= days_until_next_encounter <= 30`

**Purpose:** Identify repeated short-term healthcare utilization.

## Rapid Return Intelligence

### 7-Day Rapid Return Flag

An encounter was flagged when:

`1 <= days_until_next_encounter <= 7`

**Purpose:** Identify rapid returns and short-interval healthcare utilization.

## Utilization Velocity

Utilization velocity was calculated as:

`Rolling 180-Day Encounters / 180`

**Purpose:** Measure encounter intensity over time.

## Utilization Risk Segmentation

Based on rolling 365-day encounter counts:

| Rolling 365-Day Encounters | Category |
|---:|---|
| `>= 20` | Extreme Utilizer |
| `10–19` | High Utilizer |
| `5–9` | Moderate Utilizer |
| `< 5` | Low Utilizer |

## Observation Window

Encounter timelines were filtered using the observation window beginning:

`2015-01-01`

### Purpose

- Avoid unrealistic synthetic historical inflation
- Improve analytical realism
- Normalize rolling utilization patterns

## Data Quality Observations

The synthetic Synthea dataset produced:

- Inflated lifetime utilization
- Unrealistic longitudinal timelines
- Excessive encounter accumulation

### Mitigation

- Observation-window filtering
- Temporal validation
- Rolling-window normalization

## Analytical Learnings

This project demonstrated:

- Encounter-grain analytics
- Longitudinal healthcare modeling
- Rolling temporal windows
- Temporal feature engineering
- Healthcare event intelligence
- Readmission engineering
- Encounter-sequence analytics
- Utilization intensity modeling

## Healthcare Relevance

This type of analytical system is relevant to:

| Domain | Usage |
|---|---|
| Hospital Quality Analytics | Readmission monitoring |
| Payer Analytics | Utilization surveillance |
| Utilization Management | High-utilizer detection |
| Care Transition Programs | Rapid-return monitoring |
| Population Health | Instability detection |

## Future Extensions

Potential extensions include:

- Diagnosis-linked utilization
- Provider attribution
- Mortality prediction
- Encounter forecasting
- Utilization clustering
- ICU escalation modeling

## Final Output

Generated an encounter-level healthcare intelligence registry containing:

- Encounter sequencing
- Rolling utilization burden
- Readmission analytics
- Rapid-return surveillance
- Utilization intensity metrics
- Encounter-level risk segmentation
- Longitudinal healthcare utilization intelligence

---

# SQL Skills Demonstrated Across All Three Projects

## SQL Fundamentals

- `SELECT`
- Filtering
- Aggregation
- `GROUP BY`
- `HAVING`
- `CASE`
- `COUNT()`
- `COUNT(DISTINCT ...)`
- `MAX()`
- `MIN()`

## Joins & Relational Analysis

- `LEFT JOIN`
- Self joins
- Multi-table integration
- Patient-level aggregation
- Encounter-level aggregation

## Common Table Expressions

CTEs were used to create modular analytical pipelines for:

- KPI generation
- Patient-level aggregation
- Encounter timelines
- Readmission analysis
- Care-gap analysis
- Risk segmentation
- Rolling utilization analysis

## Window Functions

The projects used:

- `LAG()`
- `LEAD()`

for temporal healthcare analytics.

## Temporal SQL

The projects incorporated:

- `DATE_TRUNC()`
- `INTERVAL`
- `AGE()`
- `CURRENT_DATE`
- Previous encounter analysis
- Next encounter analysis
- Temporal gap calculations
- Rolling time windows
- Observation-window filtering

## Null & Data Handling

- `COALESCE()`
- Temporal validation
- Age filtering
- Plausibility checks
- Observation-window filtering

---

# Healthcare Analytics Concepts Demonstrated

Across the three projects, SQL was applied to:

- Hospital utilization
- Patient utilization
- Emergency department utilization
- Inpatient utilization
- Length of stay
- Readmission analysis
- Rapid-return analysis
- Chronic disease burden
- Medication burden
- Polypharmacy
- Care-gap analysis
- Patient risk stratification
- High-utilizer identification
- Rolling utilization
- Encounter sequencing
- Utilization intensity

---

# Analytical Progression

The three projects were developed around different analytical grains and healthcare questions.

### Project 1 — Operational Analytics

Hospital Operations  
→ Operational KPI Engineering  
→ Hospital Utilization & Performance

### Project 2 — Patient-Level Analytics

Population Health  
→ Patient-Level Registry  
→ Risk Stratification & Care Gaps

### Project 3 — Longitudinal Analytics

Longitudinal Utilization  
→ Encounter-Level Analytics  
→ Temporal Intelligence & Readmissions

Together, the projects cover:

- Operational analytics
- Patient-level analytics
- Longitudinal analytics
- Temporal analytics
- Risk stratification
- Utilization analytics

---

# Data Quality & Analytical Validation

A recurring analytical challenge across the projects was the presence of unrealistic patterns in the synthetic Synthea dataset.

## Observed Issues

- Extremely old historical dates
- Unrealistic patient ages
- Inflated lifetime utilization
- Abnormal longitudinal durations
- Excessive encounter accumulation

## Validation & Mitigation

The projects incorporated:

- Observation-window filtering
- Temporal validation
- Age filtering
- Plausibility checks
- Rolling-window normalization

These steps were used to improve analytical realism and reduce distortion caused by unrealistic synthetic timelines.

---

# Future Extensions

Potential extensions identified across the projects include:

- Payer segmentation
- Provider attribution
- Diagnosis-linked utilization analysis
- Medication adherence analytics
- Chronic disease cohorts
- Regional utilization analysis
- Predictive risk scoring
- Mortality prediction
- Encounter forecasting
- Utilization clustering
- ICU escalation modeling

---

# Analytics Stack Integration

The SQL projects can form the PostgreSQL layer of a broader healthcare analytics workflow:

Healthcare Data  
↓  
PostgreSQL  
↓  
SQL Analytical Pipelines  
↓  
Python  
↓  
Advanced Analytics / Modeling  
↓  
Power BI / Tableau  
↓  
Healthcare Dashboards & Reporting

---

# Portfolio Summary

| Project | Primary Analytical Question | Main SQL Focus |
|---|---|---|
| **Hospital Operations Dashboard** | What is happening across hospital operations and utilization? | KPI engineering, aggregation, temporal metrics |
| **Population Health Risk Registry** | Which patients demonstrate higher utilization and healthcare burden? | Patient-level aggregation, risk segmentation, multi-table CTE architecture |
| **Healthcare Readmission & Utilization Intelligence System** | How does healthcare utilization evolve across encounters over time? | `LAG()`, `LEAD()`, rolling windows, temporal feature engineering |

---

# Overall Project Outcome

These three PostgreSQL projects demonstrate the use of SQL to transform healthcare data into structured analytical datasets covering:

- Operational KPIs
- Patient utilization
- Population health risk
- Disease burden
- Medication burden
- Care gaps
- Readmissions
- Rapid returns
- Rolling utilization
- Encounter sequencing
- Utilization intensity

The portfolio demonstrates SQL application across:

**Healthcare Operations + Population Health + Longitudinal Healthcare Analytics**