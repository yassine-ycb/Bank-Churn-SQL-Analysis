-- Inserting data from the original CSV file into the tables

INSERT INTO Customer (customer_id, country, gender, age)
SELECT customer_id, country, gender, age
FROM Bank_Customer_Churn_Prediction;

INSERT INTO Banking_details (customer_id, credit_score, tenure, balance, products_number, credit_card, active_member, estimated_salary)
SELECT customer_id, credit_score, tenure, balance, products_number, credit_card, active_member, estimated_salary
FROM Bank_Customer_Churn_Prediction;

INSERT INTO Churn (customer_id, churn)
SELECT customer_id, churn
FROM Bank_Customer_Churn_Prediction;