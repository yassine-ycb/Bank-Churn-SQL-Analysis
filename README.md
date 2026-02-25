# 🏦 Bank Customer Churn Analysis - SQL Project

## 📌 Project Overview
This project simulates a real-world data analysis environment for a fictional bank. The goal is to analyze customer banking behaviors, assess data quality, and extract actionable business insights regarding customer churn.
## 🛠️ Tech Stack
* **Language:** SQL
* **Environment:** MySQL

## 🗄️ Database Architecture
The data was modeled into a relational structure with strict 1:1 relationships using `customer_id` as the Primary and Foreign Key.
1. `Customer`: Demographic data (Age, Gender, Country).
2. `Banking_details`: Financial behavior (Credit Score, Balance, Tenure, Products).
3. `Churn`: Target variable (1 = Churned, 0 = Retained).

## 🚀 Workflow
1. **Database Setup:** Creating the relational tables.
2. **Data Ingestion:** Loading raw CSV data into the structured SQL environment.
3. **Data Quality Checks:** Identifying nulls, duplicates, and outliers (e.g., age limits, zero balances, distinct spelling).
4. **Business Analysis:** Querying the clean data to extract strategic insights.

## 💡 Key Business Insights
* **Customer Loyalty vs. Up-selling:** Financial profiles stagnate over time. We do not observe any up-selling correlated with the length of the customer relationship (Tenure).
* **VIP Retention Failure:** The bank is losing its VIP customers (Credit Score > 700) at almost the same rate (19.8%) as its standard customers (20.6%). The current offering fails to retain the most profitable profiles.
* **Wealth Management Prioritization:** Identified the Top 3 wealthiest customers per country. These massive assets require immediate priority tracking to prevent severe financial churn.
