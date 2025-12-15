# Business Performance & Customer Behavior Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing business performance and customer behavior using
advanced SQL techniques. The analysis is performed on transactional data to derive
actionable insights related to revenue trends, customer lifetime value, repeat purchase
behavior, and product performance.

The project simulates a real-world business analytics scenario where SQL is used as the
primary tool for data exploration, transformation, and analysis.

---

## 🛠 Tools & Technologies
- PostgreSQL
- Advanced SQL
  - Joins
  - CTEs and Views
  - Window Functions (`LAG`, `NTILE`, Running Totals)
  - Subqueries
  - Time-based analysis

---

## 🗂 Database Schema
The database follows a normalized relational model consisting of the following tables:
- `customers` – stores customer details
- `products` – stores product information
- `orders` – stores order-level information
- `order_items` – stores line-level transaction details

A reusable analytical view (`base_orders`) is created by joining these tables to simplify
downstream analysis.

---

## 📊 Analysis Performed

### 1. Business KPIs
- Total Revenue
- Total Orders and Customers
- Monthly Revenue Trends
- Month-over-Month Revenue Growth
- Average Order Value (AOV)

### 2. Customer Behavior Analysis
- Orders per customer
- Repeat vs one-time customers
- Repeat customer rate
- Customer Lifetime Value (CLV)
- Customer segmentation using percentile-based logic

### 3. Product & Category Performance
- Revenue by product
- Best-selling products by quantity
- Revenue contribution by category
- Category-level performance metrics

### 4. Pareto (80/20) Analysis
- Identification of products contributing to the first 80% of total revenue using
  cumulative revenue calculations and window functions

---

## 📂 Project Structure
---
sql-business-performance-analysis/
│
├── README.md
├── data/
│ └── sample_schema.sql
├── sql_queries/
│ ├── 01_base_view.sql
│ ├── 02_business_kpis.sql
│ ├── 03_customer_analysis.sql
│ ├── 04_product_analysis.sql
│ └── 05_pareto_analysis.sql
└── insights/
└── key_findings.md
---


---

## 🔍 Key Insights Summary
- A small percentage of products generate the majority of revenue, demonstrating a strong
  Pareto effect.
- Repeat customers contribute significantly higher revenue compared to one-time customers.
- High-performing product categories drive a disproportionate share of total business
  revenue.

Detailed findings are documented in the `insights/key_findings.md` file.

---

## 🚀 How to Run This Project
1. Set up a PostgreSQL database.
2. Create tables using `data/sample_schema.sql`.
3. Create the analytical view using `sql_queries/01_base_view.sql`.
4. Execute analysis queries from the remaining SQL files.

---

## 📌 Use Cases
- Business performance reporting
- Customer behavior analysis
- Product and category performance evaluation

---

## 👤 Author
**Abishek**

