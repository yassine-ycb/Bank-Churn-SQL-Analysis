-- ANALYSIS 1: Impact of Tenure on the financial profile
-- OBJECTIVE: Verify if customer loyalty translates into better solvency (credit score) and higher savings.
              
SELECT
	tenure AS "Tenure_Years",
	COUNT(customer_id) AS "Number_of_Customers", 
	ROUND(AVG(credit_score), 0) AS "Average_Credit_Score",  
	ROUND(AVG(balance), 0) AS "Average_Balance", 
	ROUND(AVG(estimated_salary), 0) AS "Average_Salary"
FROM Banking_details bd
GROUP BY bd.tenure
ORDER BY bd.tenure;

-- INSIGHTS:
   -- The average credit score remains around 650, regardless of the customer's tenure.
   -- The average balance tends to stagnate, or even decrease slightly, for the most loyal customers (10 years).

-- CONCLUSION: 
-- We do not observe any up-selling correlated with the length of the customer relationship. 
-- The customers' financial profiles stagnate over the years.

												---------------------------------------------------------

-- ANALYSIS 2: Churn Rate based on customer profile quality (Credit Score)
-- OBJECTIVE: Determine if the bank manages to retain its best profiles (VIPs) compared to standard customers.

SELECT 
	CASE
		WHEN bd.credit_score > 700 THEN 'VIP Profile'
		ELSE 'Standard Profile'
	END AS "Customer_Segment",
	COUNT(bd.customer_id) AS "Number_of_Customers",
	ROUND(AVG(churn)*100, 2) AS "Churn_Rate_%"
FROM Banking_details bd 
LEFT JOIN Churn c ON c.customer_id = bd.customer_id
GROUP BY 
	CASE
		WHEN bd.credit_score > 700 THEN 'VIP Profile'
		ELSE 'Standard Profile'
	END
ORDER BY "Customer_Segment";

-- CONCLUSION: 
-- The bank is losing its VIP customers at almost the same rate (19.8%) as its standard customers (20.6%). 
-- The current offering fails to retain the most creditworthy customers, who are nevertheless the most profitable.

												---------------------------------------------------------

-- ANALYSIS 3: Top wealthiest customers by country
-- OBJECTIVE: Identify the Top 3 customers with the highest balance in each country.

WITH Country_Ranking AS (
	SELECT 
		c.country,
		bd.customer_id,
		bd.balance,
		c.age,
	        
		RANK() OVER (PARTITION BY c.country ORDER BY bd.balance DESC) AS "Ranking"
	
	FROM Customer c
	JOIN Banking_details bd ON c.customer_id = bd.customer_id
)
SELECT *
FROM Country_Ranking
WHERE Ranking <= 3;


-- INSIGHTS:
-- This query immediately isolates "Premium" profiles by geographic area.
-- The Wealth Management department must contact these customers as a priority to ensure their satisfaction and 
-- prevent any risk of churn regarding these massive assets.
