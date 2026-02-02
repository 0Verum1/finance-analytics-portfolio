-- Payments are generated from Paid invoices.
-- Rules:
-- 1 payment per Paid invoice
-- Payment date = invoice_date + a small delay (1/2/3/5/7 days)
-- Payment amount = invoice_amount
-- Payment method assigned deterministically

INSERT INTO payments (payment_id, invoice_id, payment_date, payment_amount, payment_method)
SELECT
  2000 + ROW_NUMBER() OVER (ORDER BY i.invoice_id) AS payment_id,
  i.invoice_id,
  (i.invoice_date
    + CASE (i.invoice_id % 5)
        WHEN 0 THEN 1
        WHEN 1 THEN 2
        WHEN 2 THEN 3
        WHEN 3 THEN 5
        ELSE 7
      END
  ) AS payment_date,
  i.invoice_amount AS payment_amount,
  CASE (i.invoice_id % 4)
    WHEN 0 THEN 'Credit Card'
    WHEN 1 THEN 'Bank Transfer'
    WHEN 2 THEN 'PayPal'
    ELSE 'Cash'
  END AS payment_method
FROM invoices i
WHERE i.invoice_status = 'Paid';
