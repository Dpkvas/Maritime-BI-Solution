# 📊 KPI Definitions – Maritime BI Dashboard

This document outlines the key performance indicators (KPIs) used across the Power BI dashboard, grouped by functional area.

---

## 🚨 Fleet Safety KPIs (from `Fact_Incidents`)

### 1. **Total Incidents**

* **Definition:** Total number of reported incidents within the selected time period
* **Calculation:** `COUNTROWS(Fact_Incidents)`

### 2. **High Severity Incidents**

* **Definition:** Number of incidents marked as 'High' severity
* **Calculation:** `COUNTROWS(FILTER(Fact_Incidents, [severity_level] = "High"))`

### 3. **Average Resolution Time (Days)**

* **Definition:** Average number of days taken to resolve an incident
* **Calculation:** `AVERAGEX(Fact_Incidents, DATEDIFF([reported_date], [resolved_date], DAY))`

---

## ✅ Compliance KPIs (from `Fact_ComplianceScores`)

### 4. **Average Compliance Score**

* **Definition:** Average score across all compliance checks (CHESS, BBSC, HESS)
* **Calculation:** `AVERAGE(Fact_ComplianceScores[score_value])`

### 5. **Compliance Pass Rate**

* **Definition:** Percentage of compliance records that passed threshold (typically 0.8 or 80%)
* **Calculation:** `DIVIDE(COUNTROWS(FILTER(Fact_ComplianceScores, [threshold_passed] = TRUE)), COUNTROWS(Fact_ComplianceScores))`

### 6. **Total Compliance Records**

* **Definition:** Number of compliance score entries in the selected period
* **Calculation:** `COUNTROWS(Fact_ComplianceScores)`

---

## 🚢 ELT Ship Visit KPIs (from `Fact_ShipVisits`)

### 7. **Total Ship Visits**

* **Definition:** Total number of ELT ship visits logged
* **Calculation:** `COUNTROWS(Fact_ShipVisits)`

### 8. **Visit Completion Rate**

* **Definition:** Percentage of visits marked as 'Completed'
* **Calculation:** `DIVIDE(COUNTROWS(FILTER(Fact_ShipVisits, [visit_outcome] = "Completed")), COUNTROWS(Fact_ShipVisits))`

### 9. **Missed/Postponed Visits**

* **Definition:** Total count of visits that were not completed
* **Calculation:** `COUNTROWS(FILTER(Fact_ShipVisits, [visit_outcome] IN {"Missed", "Postponed"}))`

---

## 🧑‍🏫 Training Compliance KPIs (Optional – from `Training_Records`)

### 10. **Mandatory Training Completion Rate**

* **Definition:** Percentage of mandatory training records completed
* **Calculation:** `DIVIDE(COUNTROWS(FILTER(Training_Records, [is_mandatory] = TRUE())), COUNTROWS(Training_Records))`

### 11. **Recent Training Completions**

* **Definition:** Count of trainings completed in the last 90 days
* **Calculation:** `COUNTROWS(FILTER(Training_Records, [completion_date] >= TODAY() - 90))`

---

## 📝 Notes

* All KPIs are filtered dynamically based on user selections (ship name, date range, compliance type)
* Calculations are performed using DAX and leverage optimized data models in star schema format

