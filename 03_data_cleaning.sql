-- Checking for duplicate Customer_IDs
SELECT customer_id, COUNT(*)
FROM Customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Checking for null values in the banking details table
SELECT COUNT(*) 
FROM Banking_details 
WHERE balance IS NULL OR estimated_salary IS NULL OR credit_score IS NULL;

-- Checking for null or outlier values in the age column
SELECT COUNT(*) 
FROM Customer
WHERE age IS NULL 
	OR age < 18 -- Legal age for opening a bank account
	OR age > 110; -- Plausibility limit

-- Checking how many customers have an estimated salary less than or equal to 0
SELECT COUNT(*)
FROM Banking_details
WHERE estimated_salary <=0;

-- Checking how many customers have a zero balance
SELECT COUNT(*)
FROM Banking_details
WHERE balance = 0;
-- 3617 customers, this is a metric to monitor



-- Checking spelling and distinct values for countries
SELECT DISTINCT country FROM Customer;

-- Checking spelling and distinct values for genders
SELECT DISTINCT gender FROM Customer;

-- Checking for outliers in the number of products
SELECT COUNT(*) 
FROM Banking_details 
WHERE products_number < 1 
	OR products_number > 4;

-- Checking for outlier credit scores
SELECT COUNT(*)
FROM Banking_details
WHERE credit_score < 300 
	OR credit_score > 850;
