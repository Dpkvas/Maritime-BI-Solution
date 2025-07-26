# ⚓️ Fleet Safety & Compliance BI Solution

### End-to-End Maritime Reporting with Power BI + Snowflake

---

## 📄 Project Overview

This project simulates an end-to-end BI solution for maritime safety and compliance reporting. It mimics real-world responsibilities of a BI Analyst supporting Carnival UK’s Maritime & Sustainability team, focusing on KPIs such as CHESS compliance, BBSC assessments, ELT ship visits, and incident tracking across fleet and shore teams.

The project demonstrates the full lifecycle: data warehousing (Snowflake), data modelling and analysis (Power BI), and role-based access control (RLS and masking). It is designed to showcase scalable BI architecture and dashboard design aligned with operational performance and compliance monitoring.

---

## 🔧 Tech Stack

* **Power BI**: Data modelling, DAX, dashboard design
* **Snowflake**: Cloud data warehouse, secure access policies, masking, and RLS
* **SQL**: Data definition, view creation, and transformations
* *(Optional: Power Automate)*: Simulated alerting or workflow automation

---

## 📊 KPIs & Focus Areas

* Total & high-severity incidents by ship
* Average incident resolution time
* ELT ship visit completion rate & BBSC feedback trends
* Compliance scores by ship and compliance type (CHESS, BBSC, HESS)
* Department-level training completion (optional)

---

## 📂 Repository Structure

```
maritime-bi-solution/
├── README.md
├── data/                          # Simulated CSV data
│   ├── incident_reports.csv
│   ├── ship_visit_logs.csv
│   ├── compliance_scores.csv
├── snowflake_scripts/            # SQL files to build warehouse
│   ├── create_tables.sql
│   ├── load_sample_data.sql
│   ├── create_views.sql
│   └── masking_rls_policies.sql
├── powerbi/
│   ├── dashboard_screenshots/    # Screenshots of Power BI pages
│   └── pbix_export_notes.md      # Summary of DAX, visuals, and filters used
├── documentation/
│   ├── data_model_diagram.png    # Star schema data model
│   ├── kpi_definitions.md        # Explanation of key metrics
│   └── architecture_overview.md  # Snowflake to Power BI flow
```

---

## 📋 Key Pages in Power BI Dashboard

### 1. **Fleet Safety Overview**

* Incident trend analysis
* Severity heatmaps by ship
* Resolution performance metrics

### 2. **Compliance Monitoring**

* CHESS/BBSC/HESS score trends
* Compliance pass/fail visualisation
* High/low performing ships

### 3. **Ship Visit Insights**

* ELT visit tracking by ship
* Visit outcomes (completed, missed, postponed)
* BBSC qualitative feedback (word cloud/bar summary)

---

## 📊 Data Model

* **Fact\_Incidents** – Tracks all reported incidents on ships including type, severity, reporting team, and resolution details. Supports CHESS reporting.
* **Fact\_ComplianceScores** – Contains periodic compliance audit results by ship and compliance type (CHESS, BBSC, HESS), used to monitor performance and flag risks.
* **Fact\_ShipVisits** – Records Executive Leadership Team (ELT) visits to ships, outcomes, and BBSC-related observations or feedback.
* **Dim\_Ship**, **Dim\_Date**, **Dim\_ComplianceType**, etc.

Structured as a **star schema** for optimal query performance and DAX efficiency.

---

## 🔒 Security Features

* **Row-Level Security**: Users see only the ships they’re assigned to
* **Data Masking**: Visitor names and employee IDs are masked unless appropriate roles are assigned

---

## ✨ Demo Scenarios

> * Identify ships with compliance scores below threshold over the past 3 months
> * Compare incident trends between fleet and shore teams
> * View BBSC feedback themes from ELT ship visits
> * Filter metrics by ship and compliance type

---

## 👀 Screenshots

*(Located in `powerbi/dashboard_screenshots/` folder)*

---

## 🚀 How to Use

1. Clone the repo
2. Set up a Snowflake environment and execute SQL scripts in `snowflake_scripts/`
3. Load sample CSVs into Snowflake or Power BI directly
4. Open Power BI Desktop and connect using DirectQuery or Import
5. Explore the visual dashboards and test filters, bookmarks, and RLS

---

## 🚀 Optional Enhancements

* Add Power Automate integration to trigger refresh alerts or exceptions
* Add tooltips and drill-through pages for more interactivity
* Publish to Power BI Service and test role-based views

---

## 🚀 Author

Deepak Vasudevan
*This project was inspired by the BI Analyst role at Carnival UK and reflects simulated use cases for educational and professional demonstration.*
