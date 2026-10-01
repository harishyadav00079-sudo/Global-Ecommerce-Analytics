# Global E-Commerce Analytics

## Project Overview

This project analyzes **Online Retail transaction data** to identify sales trends, customer behavior, product performance, returns, and geographic revenue patterns.

The project follows an end-to-end **Data Analytics workflow**, covering data cleaning, SQL analysis, Python exploratory analysis, and Power BI visualization.

### Project Status

 ✅ Data Cleaning — Excel
 ✅ SQL Analysis — MySQL
 ✅ Python EDA — Pandas
 ✅ Power BI Dashboard
 ✅ Business Insights & Documentation
 ✅ GitHub Portfolio — Updated

---

## Business Objective

The objective of this project is to answer practical business questions such as:

 Which countries generate the most revenue?
 Which products contribute the most to sales?
 How does revenue change over time?
 Who are the highest-value customers?
 What percentage of transactions are cancelled or returned?
 How do registered and guest customers differ?
 Which products and countries require further attention?
 What patterns can help support better business decisions?

---

## Dataset

**Dataset:** Online Retail II

The dataset contains retail transactions from **2009–2011**.

### Main Columns

| Column      | Description                  |
| ----------- | ---------------------------- |
| Invoice     | Invoice/transaction number   |
| StockCode   | Product identifier           |
| Description | Product description          |
| Quantity    | Number of units              |
| InvoiceDate | Date and time of transaction |
| Price       | Unit price                   |
| CustomerID  | Customer identifier          |
| Country     | Customer's country           |

---

# Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning — Excel
     ↓
SQL Database & Analysis — MySQL
     ↓
Python Exploratory Data Analysis — Pandas
     ↓
Power BI Dashboard
     ↓
Business Insights
```

---

# 1️ Data Cleaning — Excel

The raw Online Retail II dataset was inspected and cleaned using Microsoft Excel.

### Data Quality Checks

The following issues were investigated:

 Missing Customer IDs
 Duplicate records
 Negative quantities
 Zero-price transactions
 Blank product descriptions
 Cancelled invoices
 Unusual/adjustment transactions
 Data consistency across the two yearly datasets

### Cleaning Work

  Identified and handled duplicate records
  Investigated missing values
  Separated transaction types
  Checked unusual prices and quantities
  Prepared cleaned datasets for SQL and further analysis

---

# 2️ SQL Analysis — MySQL

The cleaned datasets were imported into **MySQL** for structured business analysis.

### SQL Analysis Includes

 Revenue analysis
 Sales by country
 Product performance
 Customer analysis
 Monthly sales trends
 Transaction analysis
 Returns/cancellations analysis
 Customer type analysis
 Aggregations and ranking
 Business-focused SQL queries

The SQL analysis contains **35 business-focused queries** covering the main analysis areas.

The SQL queries and findings are documented in:

`3_SQL/sql_queries.sql`

`7_Documentation/SQL_Analysis_Report.md`

---

# 3️ Python Analysis — Pandas

Python was used for **Exploratory Data Analysis (EDA)** and analytical validation.

### Completed Python Work

 Data loading
 Data inspection
 Missing-value analysis
 Duplicate checking
 Data quality analysis
 Revenue calculations
 Transaction classification
 Return analysis
 Customer analysis
 Country-level analysis
 Product analysis
 Monthly analysis
 GroupBy and aggregation
 Sorting and ranking
 Basic data visualization

During the analysis, non-product records such as bank charges, postage, fees, adjustments, discounts and commissions were identified and separated from product-level analysis.

### Completed Python Visualization

A country-level revenue analysis was created to identify the countries contributing the highest revenue.

### Python Tools

 Python
 Pandas
 NumPy
 Matplotlib

---

# 4️ Power BI Dashboard

An interactive Power BI dashboard was created to provide a visual overview of the e-commerce business.

### Dashboard Focus

 Revenue
 Sales trends
 Product performance
 Country performance
 Customer analysis
 Transaction analysis
 Returns/cancellations

The final dashboard export is available in:

`6_PowerBI/ecommerce_retail_data_Dashboard_final.pdf`

---

# Key Business Insights

The analysis identified several important patterns.

### Geographic Performance

The **United Kingdom** generated the highest revenue, with around **16.33 million** out of the total revenue of approximately **19.23 million**.

### Customer Contribution

Registered customers generated around **16.59 million** in revenue, compared with around **2.64 million** from guest customers.

### Valuable Customers

Customer **18102** was the highest-revenue customer at around **598K**, followed by customer **14646** at around **523K**.

### Product Performance

**REGENCY CAKESTAND 3 TIER** was the highest-revenue product at around **327K**. Other high-revenue products included WHITE HANGING HEART T-LIGHT HOLDER, JUMBO BAG RED RETROSPOT, PARTY BUNTING and ASSORTED COLOUR BIRD ORNAMENT.

### Cancellations & Returns

The dataset contained **22,889 return transactions** after handling records with missing quantities. The total returned quantity was around **1.06 million units**.

### Non-Product Records

Several descriptions were identified as non-product transactions, including Bank Charges, Postage, Amazon Fee, Manual, Discount, Commission, Samples and Adjust bad debt. These were separated when performing product-level analysis.

### Time Trends

Revenue varied considerably across months. **November 2011** had the highest monthly revenue at around **1.46 million**, while **December 2011** was around **433K** in the final monthly analysis.

---

# Data Quality Findings

During the project, several data-quality challenges were identified:

 Missing Customer IDs
 Duplicate transactions
 Negative quantities
 Zero-price records
 Blank descriptions
 Cancelled invoices
 Unusual/adjustment transactions
 Non-product financial and operational records

These issues were investigated during the Excel and Python stages before performing the main business analysis.

---

# Project Structure

```text
Global-Ecommerce-Analytics/

│
├── 1_Raw_Dataset/
│   └── online_retail_II.xlsx
│
├── 2_Excel/
│   ├── online_retail_cleaned_final.xlsx
│   └── online_retail_cleaning.xlsx
│
├── 3_SQL/
│   ├── data/
│   │   ├── online_retail_cleaning-2009-2010.csv
│   │   └── online_retail_cleaning-2010-2011.csv
│   └── sql_queries.sql
│
├── 4_Python/
│   ├── analysis.ipynb
│   └── import_to_mysql.py
│
├── 6_PowerBI/
│   └── ecommerce_retail_data_Dashboard_final.pdf
│
└── 7_Documentation/
    ├── Data_dictionery.xlsx
    ├── SQL_Analysis_Report.md
    ├── business_insights.md
    ├── project_journal.docx
    └── readme.md
```

---

# Tools & Technologies

| Category               | Tools                     |
| ---------------------- | ------------------------- |
| Spreadsheet & Cleaning | Microsoft Excel           |
| Database               | MySQL                     |
| Programming            | Python                    |
| Python Libraries       | Pandas, NumPy, Matplotlib |
| Business Intelligence  | Power BI                  |
| Documentation          | Markdown, Microsoft Word  |
| Version Control        | Git & GitHub              |

---

# Future Improvements

The project can be extended with:

 Customer segmentation
 RFM analysis
 Customer lifetime value analysis
 Product-level profitability analysis
 Sales forecasting
 Advanced Power BI/DAX analysis
 Automated data pipeline

---

# Skills Demonstrated

This project demonstrates practical experience in:

 Data Cleaning
 Exploratory Data Analysis
 SQL
 Python/Pandas
 Data Visualization
 Power BI
 Business Analysis
 Data Quality Analysis
 Customer & Sales Analysis
 Business Insight Generation
 Git & GitHub

---

## Author

**Oggu Harish**

Aspiring Data Analyst | Python | SQL | Excel | Power BI | R Programming | Git & GitHub

---

## Project Status

**Active Portfolio Project**

### Project Status

Data Cleaning — Completed

SQL Analysis — Completed

Python EDA — Completed

Power BI Dashboard — Completed

Business Insights & Documentation — Completed

GitHub Portfolio — Updated
