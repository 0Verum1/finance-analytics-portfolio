-- Costs are generated from invoices to enable gross margin analysis.
-- Rules:
-- - Only non-canceled invoices get costs (Paid + Unpaid)
-- - 2 cost lines per invoice: COGS + Shipping
-- - COGS is a variable % of invoice_amount (roughly 45%–60%)
-- - Shipping is a small fixed-ish amount

INSERT INTO costs (cost_id, invoice_id, cost_type, cost_amount)
SELECT
  3000 + ROW_NUMBER() OVER (ORDER BY i.invoice_id) AS cost_id,
  i.invoice_id,
  'COGS' AS cost_type,
  ROUND(
    i.invoice_amount
    * CASE (i.invoice_id % 4)
        WHEN 0 THEN 0.45
        WHEN 1 THEN 0.50
        WHEN 2 THEN 0.55
        ELSE 0.60
      END
  , 2) AS cost_amount
FROM invoices i
WHERE i.invoice_status <> 'Canceled';

INSERT INTO costs (cost_id, invoice_id, cost_type, cost_amount)
SELECT
  4000 + ROW_NUMBER() OVER (ORDER BY i.invoice_id) AS cost_id,
  i.invoice_id,
  'Shipping' AS cost_type,
  ROUND(
    CASE (i.invoice_id % 5)
      WHEN 0 THEN 4.99
      WHEN 1 THEN 6.99
      WHEN 2 THEN 8.99
      WHEN 3 THEN 9.99
      ELSE 12.99
    END
  , 2) AS cost_amount
FROM invoices i
WHERE i.invoice_status <> 'Canceled';
