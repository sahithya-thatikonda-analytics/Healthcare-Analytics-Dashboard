<p align="center">
  <img src="screenshots/banner.png" width="100%">
</p>

# 🏥 Healthcare Analytics Dashboard

An end-to-end Healthcare Analytics Dashboard built using **Power BI**, **PostgreSQL**, and **DAX** to transform healthcare data into actionable business insights for hospital stakeholders.

---

## 🚀 Project Highlights

- Developed a four-page interactive Healthcare Analytics Dashboard using Power BI.
- Connected PostgreSQL as the primary data source for healthcare analytics.
- Built advanced DAX measures for KPIs, Top-N analysis, ranking, and time intelligence.
- Analyzed patient demographics, diagnoses, medications, observations, and healthcare expenditure.
- Delivered Executive, Pharmacy, Clinical, and Financial dashboards tailored to different stakeholders.
- Designed an interactive data model supporting efficient filtering and cross-analysis.

---

# 📸 Dashboard Preview

## Executive Summary

![Executive Summary](screenshots/executive-summary.png)

---

## Pharmacy Analytics

![Pharmacy Analytics](screenshots/pharmacy-analytics.png)

---

## Clinical & Population Analytics

### Part 1

![Clinical Analytics Part 1](screenshots/clinical-analytics-part1.png)

### Part 2

![Clinical Analytics Part 2](screenshots/clinical-analytics-part2.png)

---

## Financial Analytics

![Financial Analytics](screenshots/financial-analytics.png)

---

# 📝 Project Overview

This project demonstrates the development of an end-to-end Healthcare Analytics Dashboard using Microsoft Power BI. The dashboard transforms healthcare data into interactive visualizations that support hospital executives, pharmacy managers, clinicians, and finance teams in making data-driven decisions.

The solution was built using the Synthea Synthetic Healthcare Dataset and focuses on four major business domains:

- Executive Reporting
- Pharmacy Analytics
- Clinical & Population Analytics
- Financial Analytics

---

# 🎯 Business Problem

Healthcare organizations generate large volumes of clinical, pharmacy, patient, and financial data. Without an interactive analytics platform, it becomes difficult to answer questions such as:

- Which diseases are diagnosed most frequently?
- Which medications contribute the highest treatment cost?
- Which counties generate the highest healthcare expenditure?
- How much do patients pay compared to insurance providers?
- Which encounter classes consume the greatest medication budget?

This dashboard answers these questions through interactive Power BI reports powered by DAX calculations.

---

# 📊 Dashboard Pages

## 1️⃣ Executive Summary

Provides a high-level overview of hospital performance.

### Key Metrics

- Total Patients
- Total Encounters
- Total Medication Cost
- Patient Out-of-Pocket Cost
- Average Cost per Patient
- County Performance
- Monthly Trends

---

## 2️⃣ Pharmacy Analytics

Provides detailed medication utilization and pharmacy expenditure analysis.

### Key Features

- Dynamic Top-N Medication Analysis
- Medication Cost Ranking
- Prescription Frequency
- Medication Cost by County
- Medication Cost by Encounter Class
- High Cost vs High Volume Medication Analysis

---

## 3️⃣ Clinical & Population Analytics

Analyzes disease burden and patient demographics.

### Key Features

- Top Diagnoses
- Disease Distribution
- Age Group Analysis
- Gender Distribution
- Race Distribution
- County Distribution
- Observation Trends
- Medication Cost by Disease
- Diagnosis vs Medication Analysis

---

## 4️⃣ Financial Analytics

Analyzes healthcare expenditure and financial performance.

### Key Features

- Total Medication Cost
- Insurance Coverage
- Patient Out-of-Pocket Cost
- Average Cost per Patient
- Average Cost per Encounter
- Healthcare Expenditure by County
- Medication Cost by Disease
- Monthly Financial Trends

---


# 🏗 Data Model

The dashboard is built on a relational healthcare data model using PostgreSQL. The model integrates patient demographics, encounters, diagnoses, medications, observations, and a calendar table to enable efficient filtering, time intelligence, and cross-functional healthcare analytics.

<p align="center">
  <img src="screenshots/data-model.png" width="90%">
</p>

### Tables Used

| Table | Purpose |
|-------|---------|
| Patients | Stores patient demographic information such as age, gender, race, county, and birthdate. |
| Encounters | Contains healthcare visits including encounter class and encounter dates. |
| Conditions | Stores patient diagnoses associated with encounters. |
| Medications | Contains prescribed medications, medication cost, payer coverage, and patient out-of-pocket expenses. |
| Observations | Includes vital signs and laboratory observations recorded during patient care. |
| Calendar | Supports time intelligence, monthly trends, and year-over-year analysis in Power BI. |


---

# 🗂 Dataset

**Dataset Source**

Synthea Synthetic Healthcare Dataset

This synthetic Electronic Health Record (EHR) dataset enables healthcare analytics without exposing real patient information.

Additional dataset documentation is available here:

```text
dataset/dataset_description.md
```

---

# 🛠 Technologies Used

- Microsoft Power BI
- DAX (Data Analysis Expressions)
- PostgreSQL
- Power Query
- GitHub
- Synthea Synthetic Healthcare Dataset

---

# 📈 Key DAX Concepts Used

This project demonstrates the practical application of:

- CALCULATE()
- FILTER()
- ALL()
- VALUES()
- SUMX()
- AVERAGEX()
- RANKX()
- TOPN()
- SELECTEDVALUE()
- DIVIDE()
- VAR

---

# 💡 Key Business Insights

The dashboard enables healthcare stakeholders to:

- Identify the most frequently diagnosed diseases.
- Analyze disease burden across age, gender, race, and county.
- Identify high-cost medications and expensive disease treatments.
- Compare patient out-of-pocket expenses with insurance coverage.
- Analyze medication utilization across encounter classes.
- Monitor healthcare expenditure trends over time.
- Perform dynamic Top-N medication analysis using disconnected parameter tables.

---

## Power BI File

The PBIX file is not included in this repository because of GitHub file size limitations.

Dashboard screenshots and complete project documentation are available in this repository.

An interactive Power BI Service version will be added in the future.
---

# 🚀 Future Enhancements

- Integration with real Electronic Health Record (EHR) systems
- Predictive Healthcare Analytics
- Machine Learning for Disease Risk Prediction
- Real-time Dashboard Refresh
- Role-Based Security (Row-Level Security)
- Power BI Service Deployment

---

## 🛠 Tech Stack

- Microsoft Power BI
- PostgreSQL
- DAX
- Power Query
- Data Modeling
- GitHub

---

## Business Questions

- Which medications contribute the highest treatment cost?
- Which encounter types generate the largest expenditure?
- Which diseases have the highest prevalence?
- Which counties consume the highest healthcare budget?
- How does medication cost change over time?

---

## Key Insights

- Middlesex County contributed the highest healthcare expenditure.
- COVID-19 and related respiratory conditions accounted for the highest medication costs.
- Outpatient and ambulatory encounters generated the largest pharmacy spending.
- Medication expenditure remained relatively stable throughout the year with periodic spikes.

---

## Skills Demonstrated

- Data Cleaning
- Data Modeling
- DAX
- Time Intelligence
- KPI Development
- Dashboard Design
- Business Intelligence
- Healthcare Analytics
- PostgreSQL Integration

---

# 👤 Author

**Sahithya Thatikonda**

Pharm.D Student

Aspiring Healthcare Data Analyst

Interested in:

- Healthcare Analytics
- Clinical Research
- Pharmacovigilance
- Business Intelligence
- Data Visualization

---
