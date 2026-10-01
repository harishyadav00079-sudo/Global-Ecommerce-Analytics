-- ============================================
-- GLOBAL E-COMMERCE ANALYTICS
-- SQL BUSINESS ANALYSIS
-- Queries Q1-Q15
-- ============================================


-- Q1. Total number of transactions/rows

SELECT COUNT(*) AS total_rows
FROM retail_data;

-- Q2. Transaction count by transaction type

SELECT Transaction_Type, COUNT(*) AS transaction_counts
FROM retail_data
GROUP BY Transaction_Type;

-- Q3. Revenue by transaction type

SELECT Transaction_Type,  SUM(Quantity * Price) AS Revenue
FROM retail_data
GROUP BY Transaction_Type
ORDER BY Revenue DESC;

-- Q4. Net revenue

SELECT SUM(Quantity * Price) AS net_revenue
FROM retail_data;

-- Q5. Revenue by customer type

SELECT Customer_Type, SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Customer_Type
ORDER BY revenue DESC;

-- Q6. Transaction count by customer type

SELECT Customer_Type, COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Customer_Type;

-- Q7. Average revenue per transaction by customer type

SELECT Customer_Type, AVG(Quantity * Price) AS avg_revenue_per_transaction
FROM retail_data
GROUP BY Customer_Type;

-- Q8. Total quantity by customer type

SELECT Customer_Type, SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Customer_Type;

-- Q9. Top 10 countries by revenue

SELECT Country, SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;

-- Q10. Top 10 countries by transaction count

SELECT Country, COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Country
ORDER BY transaction_count DESC
LIMIT 10;

-- Q11. Top 10 countries by average transaction value

SELECT Country, AVG(Quantity * Price) AS avg_transaction_value
FROM retail_data
GROUP BY Country
ORDER BY avg_transaction_value DESC
LIMIT 10;

-- Q12. Top 10 countries by total quantity

SELECT Country, SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Country
ORDER BY total_quantity DESC
LIMIT 10;

-- Q13. Top 10 countries by return transactions

SELECT Country, COUNT(*) AS return_transactions
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY return_transactions DESC
LIMIT 10;

-- Q14. Top 10 countries by returned quantity

SELECT Country, SUM(Quantity) AS returned_quantity
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY returned_quantity ASC
LIMIT 10;

-- Q15. Return rate by country

SELECT Country, COUNT(*) AS total_transactions,
 SUM( CASE  WHEN Transaction_Type = 'Returns' THEN 1 ELSE 0 END) AS return_transactions,
 ROUND(SUM(CASE WHEN Transaction_Type = 'Returns' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2
    ) AS return_rate
FROM retail_data
GROUP BY Country
HAVING COUNT(*) >= 1000
ORDER BY return_rate DESC;

## Customer Analysis

-- Q16. Top 10 Customers by Revenue

SELECT Customer_ID, SUM(Quantity * Price) AS revenue
FROM retail_data
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY revenue DESC
LIMIT 10;

-- Q17. Top 10 Customers by Quantity

SELECT Customer_ID, SUM(Quantity) AS total_quantity
FROM retail_data
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY total_quantity DESC
LIMIT 10;

-- Q18. Top 10 Customers by Transaction Count

SELECT Customer_ID, COUNT(*) AS transaction_count
FROM retail_data
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY transaction_count DESC
LIMIT 10;

-- Q19. Average Transaction Value by Customer

SELECT Customer_ID, AVG(Quantity * Price) AS avg_transaction_value
FROM retail_data
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY avg_transaction_value DESC
LIMIT 10;

-- Q20. High-Value and Frequent Customers

SELECT Customer_ID, COUNT(*) AS transaction_count, SUM(Quantity * Price) AS revenue
FROM retail_data
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
HAVING COUNT(*) >= 20
ORDER BY revenue DESC
LIMIT 10;

-- Q21. Top 10 Customers by Return Transactions

SELECT Customer_ID, COUNT(*) AS return_transactions
FROM retail_data
WHERE Customer_ID IS NOT NULL
  AND Transaction_Type = 'Returns'
GROUP BY Customer_ID
ORDER BY return_transactions DESC
LIMIT 10;

-- Q22. Customer Return Rate

SELECT Customer_ID, COUNT(*) AS total_transactions,
 SUM(CASE WHEN Transaction_Type = 'Returns' THEN 1 ELSE 0 END ) AS return_transactions,
 ROUND(SUM(CASE WHEN Transaction_Type = 'Returns' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*),2
    ) AS return_rate
FROM retail_data
WHERE `Customer ID` IS NOT NULL
GROUP BY `Customer ID`
HAVING COUNT(*) >= 20
ORDER BY return_rate DESC
LIMIT 10;

## Product Analysis

-- Q23. Top 10 Products by Revenue

SELECT Description,SUM(Quantity*Price) AS revenue
FROM products_df
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


-- Q24. Top 10 Products by Quantity Sold

SELECT Description,SUM(Quantity) AS total_quantity
FROM products_df
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;


-- Q25. Top 10 Products by Transaction Count

SELECT Description,COUNT(*) AS transaction_count
FROM products_df
GROUP BY Description
ORDER BY transaction_count DESC
LIMIT 10;


-- Q26. Average Selling Price by Product

SELECT Description,AVG(Price) AS avg_price
FROM products_df
GROUP BY Description
ORDER BY avg_price DESC
LIMIT 10;


-- Q27. Products with the Highest Return Quantity

SELECT Description,SUM(Quantity) AS returned_quantity
FROM products_df
WHERE Transaction_Type='Returns'
GROUP BY Description
ORDER BY returned_quantity ASC
LIMIT 10;


-- Q28. Products with the Highest Net Revenue Loss

SELECT Description,SUM(Quantity*Price) AS revenue
FROM products_df
GROUP BY Description
HAVING revenue<0
ORDER BY revenue ASC
LIMIT 10;


-- Q29. Top Products by Revenue and Quantity

SELECT Description,SUM(Quantity) AS total_quantity,SUM(Quantity*Price) AS revenue
FROM products_df
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;

--Time Analysis

--Q30 . Monthly Revenue

SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
SUM(Quantity*Price) AS Revenue
FROM retail_data
WHERE Transaction_Type = "Sale"
Group By month
Order By month;

--Q31 . Monthly Transactions Count

SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
COUNT(*) AS transaction_count
FROM retail_data
GROUP BY month
ORDER BY month;

--Q32 . Monthly Quantity

SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
SUM(Quantity) AS total_quantity
FROM retail_data
WHERE Transaction_Type='Sale'
GROUP BY month
ORDER BY month;

--Q33 . Average Monthly Revenue

SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
ROUND(AVG(Quantity*Price),2) AS avg_revenue
FROM retail_data
WHERE Transaction_Type = 'Sale'
GROUP BY month
ORDER BY month;

--Q34 . Monthly Return Analysis

SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
COUNT(*) AS return_count,
SUM(Quantity) AS Return_Quantity,
SUM(Quantity * Price) AS return_revenue
FROM retail_data
WHERE Transaction_Type = "Returns"
GROUP BY month
ORDER BY month;