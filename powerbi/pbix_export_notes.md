# 📄 PBIX Export Notes – Maritime BI Dashboard

This file describes the structure, key measures, filters, and logic used in the Power BI report for the Maritime Fleet Safety & Compliance dashboard project.

---

## 📁 Pages Included in the Report

### 1. **Fleet Safety Overview**

* **Visuals:** Total incidents, severity distribution, trend by month, average resolution time
* **Key Measures:**

  * `Total Incidents`
  * `High Severity Count`
  * `Avg Resolution Time`
* **Filters/Slicers:** Ship Name, Incident Type, Date Range

### 2. **Compliance Monitoring**

* **Visuals:** Compliance pass/fail rates, average compliance score by ship/type, trend lines
* **Key Measures:**

  * `Compliance Pass Rate`
  * `Avg Compliance Score`
  * `Total Compliance Records`
* **Conditional Formatting:** Score thresholds:

  * < 0.7 → Red
  * 0.7–0.8 → Orange
  * 0.8–0.9 → Yellow
  * > 0.9 → Green
* **Filters/Slicers:** Ship Name, Compliance Type, Date Range

### 3. **Ship Visit Insights**

* **Visuals:** Visit completion rate KPI, missed/postponed table, visit trends, BBSC feedback bar chart
* **Key Measures:**

  * `Visit Completion Rate`
  * `Missed/Postponed Count`
  * `Total Visits`
* **Filters/Slicers:** Ship Name, Visit Outcome, Visit Date

---

## 🔁 Interactivity

* **Drill-through Enabled:** Ship-level deep dive to performance and compliance trend pages
* **Bookmarks:** Toggle views between trend summaries and ship-level performance (planned)
* **Tooltips:** Custom tooltips on incident charts showing top incident types and average severity

---

## 🔒 Security Logic

* **Row-Level Security (RLS):**

  * Based on `ShipAccess` table
  * DAX: `[UserEmail] = USERPRINCIPALNAME()`
  * Limits data to only ships assigned to logged-in user

---

## 📌 Data Sources

* Connected to Snowflake using DirectQuery
* Based on views:

  * `VW_INCIDENTS_BY_SHIP`
  * `VW_COMPLIANCE_TRENDS`
  * `VW_SHIP_VISITS`

---

## 💡 Notes

* All measures are built as DAX using `CALCULATE`, `AVERAGE`, `COUNTROWS`, and `DIVIDE` for flexibility
* Data model follows a star schema, ensuring optimized performance
* Report designed with a navy/gold color scheme to reflect Carnival UK branding

---

*For more information, see the README.md and KPI Definitions documentation.*

