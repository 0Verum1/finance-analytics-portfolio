# SQL Finance Case

## 🧠 Business Problem

This project demonstrates financial analytics using SQL. The goal is to analyze revenue, costs, margins, and customer behavior from transactional tables to generate metrics commonly used in finance teams.

---

## 📊 Data Description

**Tables included (mock or cleaned):**
- `customers`
- `invoices`
- `payments`
- `costs`

Each table includes time and business dimensions.

---

## 🔍 Questions Addressed

1. Monthly revenue trends  
2. Gross margins over time  
3. Customer retention & churn proxies  
4. Revenue per customer  
5. Cost breakdown & insights

---
### Schema Design

**customers**
- customer_id
- first_name
- last_name
- email
- signup_date

**invoices**
- invoice_id
- customer_id
- invoice_date
- invoice_amount
- invoice_status

**payments**
- payment_id
- invoice_id
- payment_date
- payment_amount
- payment_method

**costs**
- cost_id
- invoice_id
- cost_type
- cost_amount
---
### Question → Data Mapping

| Business Question | Relevant Table(s) |
|------------------|-------------------|
| Monthly revenue trend | invoices (invoice_date, invoice_amount) |
| Gross margin over time | invoices, costs (invoice_amount, cost_amount) |
| Customer retention | customers, invoices |
| Revenue per customer | customers, invoices |
| Churn proxy | customers, invoices |
---
## 🛠 Tools & Methods

- SQL: table creation, joins, aggregations, window functions  
- Business problems translated into query logic

---

## 📈 Key Insights

1. Revenue growth or decline observations  
2. Customer retention behavior over time  
3. Cost drivers explanation
4. Other actionable notes

---

## 📂 Files

- `schema.sql` – schema definitions  
- `queries.sql` – major queries producing metrics
- `data/` – dataset files (if small or mock)
