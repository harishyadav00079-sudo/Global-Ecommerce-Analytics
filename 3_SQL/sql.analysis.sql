-- ============================================
-- GLOBAL E-COMMERCE ANALYTICS
-- SQL BUSINESS ANALYSIS
-- Queries Q1-Q15
-- ============================================


-- Q1. Total number of transactions/rows
-- Business question:
-- How many records are present in the retail dataset?

SELECT
    COUNT(*) AS total_rows
FROM retail_data;


-- Q2. Transaction count by transaction type
-- Business question:
-- How many Sale, Return, and Adjustment transactions are present?

SELECT
    Transaction_Type,
    COUNT(*) AS transaction_counts
FROM retail_data
GROUP BY Transaction_Type;


-- Q3. Revenue by transaction type
-- Business question:
-- How much revenue is associated with each transaction type?

SELECT
    Transaction_Type,
    SUM(Quantity * Price) AS Revenue
FROM retail_data
GROUP BY Transaction_Type
ORDER BY Revenue DESC;


-- Q4. Net revenue
-- Business question:
-- What is the overall net revenue after sales, returns,
-- and adjustments?

SELECT
    SUM(Quantity * Price) AS net_revenue
FROM retail_data;


-- Q5. Revenue by customer type
-- Business question:
-- How much revenue comes from Registered vs Guest customers?

SELECT
    Customer_Type,
    SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Customer_Type
ORDER BY revenue DESC;


-- Q6. Transaction count by customer type
-- Business question:
-- How many transactions does each customer type have?

SELECT
    Customer_Type,
    COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Customer_Type;


-- Q7. Average revenue per transaction by customer type
-- Business question:
-- What is the average revenue generated per transaction
-- for each customer type?

SELECT
    Customer_Type,
    AVG(Quantity * Price) AS avg_revenue_per_transaction
FROM retail_data
GROUP BY Customer_Type;


-- Q8. Total quantity by customer type
-- Business question:
-- How many units are involved in transactions for each
-- customer type?

SELECT
    Customer_Type,
    SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Customer_Type;


-- Q9. Top 10 countries by revenue
-- Business question:
-- Which countries generate the most revenue?

SELECT
    Country,
    SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;


-- Q10. Top 10 countries by transaction count
-- Business question:
-- Which countries have the highest number of transactions?

SELECT
    Country,
    COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Country
ORDER BY transaction_count DESC
LIMIT 10;


-- Q11. Top 10 countries by average transaction value
-- Business question:
-- Which countries have the highest average revenue
-- per transaction?

SELECT
    Country,
    AVG(Quantity * Price) AS avg_transaction_value
FROM retail_data
GROUP BY Country
ORDER BY avg_transaction_value DESC
LIMIT 10;


-- Q12. Top 10 countries by total quantity
-- Business question:
-- Which countries account for the highest quantity
-- of products?

SELECT
    Country,
    SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Country
ORDER BY total_quantity DESC
LIMIT 10;


-- Q13. Top 10 countries by return transactions
-- Business question:
-- Which countries have the highest number of
-- return transactions?

SELECT
    Country,
    COUNT(*) AS return_transactions
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY return_transactions DESC
LIMIT 10;


-- Q14. Top 10 countries by returned quantity
-- Business question:
-- Which countries have the largest number of
-- returned units?

SELECT
    Country,
    SUM(Quantity) AS returned_quantity
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY returned_quantity ASC
LIMIT 10;


-- Q15. Return rate by country
-- Business question:
-- What percentage of transactions are returns
-- in each country?
--
-- Only countries with at least 1,000 transactions
-- are included to avoid misleading rates from
-- very small transaction volumes.

SELECT
    Country,
    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN Transaction_Type = 'Returns' THEN 1
            ELSE 0
        END
    ) AS return_transactions,

    ROUND(
        SUM(
            CASE
                WHEN Transaction_Type = 'Returns' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS return_rate

FROM retail_data
GROUP BY Country
HAVING COUNT(*) >= 1000
ORDER BY return_rate DESC;

