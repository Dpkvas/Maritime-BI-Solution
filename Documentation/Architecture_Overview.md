# 🏗️ Architecture Overview – Maritime BI Dashboard

This document provides a high-level overview of the technical architecture used to implement the end-to-end Fleet Safety & Compliance BI solution.

---

## 🌐 Architecture Components

### 1. **Data Sources (CSV Simulated)**

* `incident_reports.csv`
* `ship_visit_logs.csv`
* `compliance_scores.csv`


These simulate real-world data extracted from operational systems such as maintenance logs, audit platforms, and leadership visit records.

---

### 2. **Snowflake Data Warehouse**

#### ❄️ Key Features:

* Cloud-based storage and compute
* Scalable SQL engine with support for dynamic data masking and RLS
* Central staging and reporting schema: `FLEET_COMPLIANCE_DB.MARITIME_REPORTING`

#### 📂 Tables:

* Fact tables: `INCIDENT_REPORTS`, `SHIP_VISIT_LOGS`, `COMPLIANCE_SCORES`, `TRAINING_RECORDS`
* Views for reporting: `VW_INCIDENTS_BY_SHIP`, `VW_COMPLIANCE_TRENDS`, `VW_SHIP_VISITS`, etc.
* Masking policies: Applied to fields like `visitor_name` and `employee_id`
* RLS implemented via `ShipAccess` bridge table

---

### 3. **Power BI – Semantic Model + Visualization Layer**

#### 🧱 Data Modelling:

* Imported or DirectQuery to Snowflake
* Star schema with shared dimensions (e.g., `Dim_Ship`, `Dim_Date`, `Dim_ComplianceType`)
* DAX measures created for KPI calculations

#### 📊 Report Pages:

* **Fleet Safety Overview** – incident trends, resolution time
* **Compliance Monitoring** – pass rate, score distribution, threshold performance
* **Ship Visit Insights** – visit completion, BBSC feedback, visit outcomes

#### 🛡️ Security:

* **Row-Level Security (RLS):** Users see only ships assigned in `ShipAccess` table
* **Data Masking:** PII fields masked unless role permits

---

### 🔁 Workflow Summary

```
CSV Data → Snowflake Staging Tables → SQL Views → Power BI Dataset → Report Pages
```

---

## 🧩 Optional Add-ons (Future Enhancements)

* Power Automate integration for scheduled alert emails (e.g., missed compliance)
* Snowpipe or external stage for live data ingestion
* Integration with SharePoint or Teams for report distribution

---

## 📌 Diagram Suggestion (not included)

* A layered diagram showing:

  * Source files feeding into Snowflake
  * Views pushing clean data to Power BI
  * Users accessing secure dashboards with RLS

---

For schema details, see `create_tables.sql` and `data_model_diagram.png`. For KPI logic, refer to `kpi_definitions.md`.
