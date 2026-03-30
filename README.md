# 📊 Loan Application Analysis (Power BI + MySQL)

## 🧠 Project Overview

This project analyzes loan application data to evaluate performance, assess risk, and determine whether the loan application feature should be continued.

Data was sourced from a MySQL database and visualized using Power BI to generate actionable business insights.

---
### Overview
![Overview]([Overview.png](https://github.com/opadotun-taiwo/creadit_risk_monitoring/blob/main/Overview.png))

## 🎯 Objective

- Evaluate loan performance  
- Identify repayment trends  
- Measure risk (good vs bad loans)  
- Provide a recommendation on whether to continue the loan feature  

---

## 🛠️ Tech Stack

- **Database:** MySQL  
- **Visualization:** Power BI  
- **Automation:** Power Automate  

---

## 📂 Data Source

The dataset includes:

- Loan applications  
- Loan amount funded  
- Total payment received  
- Loan status (Fully Paid, Current, Default, Charged Off)  
- Customer and state information  

---

## 📊 Key Metrics

- Total Loan Applications  
- Total Funded Amount  
- Total Amount Received  
- Net Profit (Received – Funded)  
- Good vs Bad Loan Ratio  

---

## 🔍 Key Insights

- **Good to Bad Loan Ratio:** 6 : 1  
- **Repayment Rate:** ~86%  
- **Default Rate:** ~13%  

### 📌 Interpretation

- Strong loan performance  
- Low default risk  
- Healthy and sustainable loan portfolio  

---

## ✅ Recommendation

The loan application feature **should be continued**.

### Suggested Improvements:
- Prioritize loans for employees with **10+ years experience**
- Improve borrower segmentation
- Continuously monitor loan performance trends  

---

## 📈 Dashboard Pages

## 📈 Dashboard Preview

### Insights
![Insights]([images/insights.png](https://github.com/opadotun-taiwo/creadit_risk_monitoring/blob/main/insights.png))

### Details
![Details](images/[details.png](https://github.com/opadotun-taiwo/creadit_risk_monitoring/blob/main/details.png))

### Automated Report
![Automated Report]([images/automation.png](https://github.com/opadotun-taiwo/creadit_risk_monitoring/blob/main/automated report.png))

---

## ⚠️ Challenges Faced

### 1. MySQL Password Access Issue

**Problem:** Could not access MySQL due to password failure  

**Solution:**
```bash
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"

.\mysqld --defaults-file="C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" --init-file="C:\Users\admin\Downloads\reset.txt" --console
