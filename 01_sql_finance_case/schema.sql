CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE
);

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    invoice_amount NUMERIC(10,2),
    invoice_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    payment_amount NUMERIC(10,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

CREATE TABLE costs (
    cost_id INT PRIMARY KEY,
    invoice_id INT,
    cost_type VARCHAR(50),
    cost_amount NUMERIC(10,2),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);
