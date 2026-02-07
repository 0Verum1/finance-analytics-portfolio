# SQL Finance Case

## 🧠 Business Problem

This project demonstrates how SQL can be used to analyze core financial and customer metrics from transactional data.
The objective is to help finance teams understand revenue trends, profitability, customer behavior, and potential churn
in order to support better financial planning and decision-making.

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

1. How has monthly revenue evolved over time?
2. How have gross profit and gross margin changed over time?
3. What does customer retention look like, and which customers appear to be churning?
4. What is the average revenue generated per customer?
5. What are the main cost drivers affecting profitability?

---

### Schema Design

The schema is designed to reflect a simple transactional business model where customers generate invoices,
invoices receive payments, and costs are associated with delivering each sale.

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

Churn is defined using a proxy approach, where customers with no recorded invoices within a defined recent period
are considered inactive or potentially churned.

---

## 🛠 Tools & Methods

- SQL: table creation, joins, aggregations, window functions  
- Business problems translated into query logic

---

## 📈 Expected Insights

1. Identification of revenue growth or decline patterns over time
2. Insights into customer retention and inactivity trends
3. Understanding of key cost drivers impacting margins
4. Observations that could inform pricing, cost control, or customer strategy

- Monthly revenue trends highlight periods of growth, seasonality, and potential slowdowns.
- Gross margin analysis highlights how profitability evolves over time and
  whether changes are driven by revenue growth or cost behavior.
- Cohort-based retention analysis reveals how customer engagement decays over time and whether newer cohorts retain better or worse than earlier ones.
- Revenue per customer analysis highlights customer monetization levels and
  potential revenue concentration among top customers.
- Churn proxy analysis identifies customers who have become inactive based on
  recent behavior, supporting retention risk assessment and forecasting.





---

## 📂 Files

- `schema.sql` – schema definitions  
- `queries.sql` – major queries producing metrics
- `data/` – dataset files (if small or mock)
