dataset.md

# Dataset Description

## Dataset Source

This project uses the **Synthea Synthetic Healthcare Dataset**, an open-source synthetic electronic health record (EHR) dataset designed for healthcare analytics, education, and research.

Unlike real hospital data, Synthea generates realistic patient records while protecting patient privacy.

---

# Purpose of Using the Dataset

The dataset was selected because it provides realistic healthcare information across multiple clinical domains while avoiding privacy concerns associated with real patient records.

It enables healthcare analytics projects involving:

- Patient demographics
- Clinical conditions
- Medication utilization
- Healthcare encounters
- Clinical observations
- Healthcare expenditure

---

# Tables Used

## Patients

Contains demographic information about each patient.

Important fields include:

- Patient ID
- Birth Date
- Gender
- Race
- County
- State

---

## Encounters

Contains every healthcare visit made by a patient.

Important fields include:

- Encounter ID
- Patient ID
- Encounter Class
- Encounter Date

---

## Medications

Contains medication prescriptions associated with healthcare encounters.

Important fields include:

- Medication Description
- Medication Cost
- Payer Coverage
- Patient Cost

---

## Conditions

Contains diagnoses recorded during healthcare encounters.

Important fields include:

- Condition Description
- Encounter ID
- Patient ID

---

## Observations

Contains clinical observations such as vital signs and laboratory measurements.

Important fields include:

- Observation Description
- Observation Value
- Units
- Observation Date

---

## Calendar Table

A custom calendar table created in Power BI to support time intelligence calculations and trend analysis.

---

# Data Model

The project uses a relational data model connecting patients, encounters, medications, conditions, and observations.

Relationships enable interactive filtering across dashboard pages and support healthcare analytics through DAX measures.

---

# Limitations

- Synthetic healthcare data
- Not intended for clinical decision-making
- Represents simulated healthcare records
- Used solely for educational and portfolio purposes