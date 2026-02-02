# Sales Density Analysis (SQL & Power BI)

## Project Overview

This project analyzes **sales and transaction density patterns** across daily and weekly time dimensions.  
SQL is used for data preparation and aggregation, while Power BI is used to visualize **transaction intensity, temporal trends, and volume distribution**.

The goal of the project is to understand **when sales activity is concentrated**, identify recurring patterns, and support operational and analytical decision-making.

---

## Dataset

**Source:** Kaggle – Adidas Sales Dataset  

The original dataset was obtained from Kaggle and required cleaning and transformation before analysis.  
All SQL queries and Power BI dashboards in this project are built using the processed dataset below:

- `adidas_sales_cleaned.csv`

---

## Tools & Technologies

- **SQL (MySQL)** – Data cleaning, aggregation, reporting views  
- **Power BI** – Dashboard design and visual analytics  
- **GitHub** – Project version control and portfolio presentation  

---

## Dashboards

### 1. Sales Density Overview – Daily & Weekly Patterns

This dashboard provides a high-level overview of **order density patterns** across days of the week and over time.

**Visuals included:**
- Order Density by Day of Week  
- Weekly Order Density Trend  
- Daily Order Density – Summary Table  
- Weekly Units Sold Trend  

**Purpose:**  
To identify recurring daily patterns and weekly fluctuations in order activity.

**Screenshot:**  
`powerbi/sales_density_overview_daily_weekly_patterns.png`

---

### 2. Sales Density Analysis – Day & Week Overview

This dashboard focuses on **metric-driven analysis** using KPIs and distribution-based visuals.

**Visuals included:**
- Total Transactions  
- Average Transactions per Day  
- Average Units per Transaction  
- Sales Volume by Day of Week  
- Total Transactions by Day of Week  
- Weekly Sales Volume Trend  
- Distribution of Days by Transaction Volume Category  

**Purpose:**  
To evaluate transaction intensity, sales volume concentration, and operational load distribution.

**Screenshot:**  
`powerbi/sales_density_analysis_day_week_overview.png`

---

## Key Insights

- Transaction activity is relatively balanced across weekdays, with **Tuesday and Friday** showing slightly higher density.
- Weekly trends reveal **clear seasonality and recurring spikes**, indicating cyclical demand behavior.
- Most days fall into the **medium transaction volume category**, suggesting operational stability rather than extreme volatility.
- Average units per transaction indicate a **consistent basket size**, supporting predictable sales behavior.

---

## Project Structure

sales-density-analysis-sql-powerbi/
│
├── data/
│   └── adidas_sales_cleaned.csv
│
├── powerbi/
│   ├── sales_density_overview_daily_weekly_patterns.png
│   └── sales_density_analysis_day_week_overview.png
│
├── sql/
│   └── sales_density_views.sql
│
└── README.md
