-- I am simulating a real-world database architecture. Instead of using a single flat file, I partitioned the data into three specific tables.
-- It's based on their logical domain: Customer, Banking_details, and Churn
-- They are securely joined through a strict one-to-one relationship using customer_id as both the primary and foreign key.

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    country VARCHAR(50),
    gender VARCHAR(20),
    age INT
);

CREATE TABLE Banking_details (
	customer_id INT PRIMARY KEY,
    credit_score INT,
    tenure INT,
    balance DECIMAL(15, 2),
    products_number INT,
    credit_card INT,
    active_member INT,
    estimated_salary DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Churn (
    customer_id INT PRIMARY KEY,
    churn INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);