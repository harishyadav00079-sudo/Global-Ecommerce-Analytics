# SQL Analysis Report

## Global E-Commerce Analytics

This file contains the SQL analysis performed on the cleaned Online Retail II dataset.

Table used: `retail_data`

Total records in the SQL table: **1,055,238**

---

## Q1. Total Records

```sql
SELECT COUNT(*) AS total_rows
FROM retail_data;
```

Result:

**1,055,238**

---

## Q2. Transaction Types

```sql
SELECT
    Transaction_Type,
    COUNT(*) AS transaction_counts
FROM retail_data
GROUP BY Transaction_Type;
```

Result:

* Sale: 1,035,799
* Returns: 19,433
* Adjustment: 6

---

## Q3. Revenue by Transaction Type

```sql
SELECT
    Transaction_Type,
    SUM(Quantity * Price) AS Revenue
FROM retail_data
GROUP BY Transaction_Type
ORDER BY Revenue DESC;
```

Result:

* Sale: 20,902,829.41
* Returns: -1,523,414.81
* Adjustment: -147,614.08

---

## Q4. Net Revenue

```sql
SELECT
    SUM(Quantity * Price) AS net_revenue
FROM retail_data;
```

Result:

**19,231,800.52**

This is the revenue after including returns and adjustments.

---

## Q5. Revenue by Customer Type

```sql
SELECT
    Customer_Type,
    SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Customer_Type
ORDER BY revenue DESC;
```

Result:

* REGISTERED: 16,593,393.01
* GUEST: 2,638,407.51

Registered customers generated most of the revenue.

---

## Q6. Transaction Count by Customer Type

```sql
SELECT
    Customer_Type,
    COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Customer_Type;
```

This was used to compare the number of transactions made by guest and registered customers.

---

## Q7. Average Revenue per Transaction

```sql
SELECT
    Customer_Type,
    AVG(Quantity * Price) AS avg_revenue_per_transaction
FROM retail_data
GROUP BY Customer_Type;
```

This shows the average revenue associated with a transaction for each customer type.

---

## Q8. Quantity by Customer Type

```sql
SELECT
    Customer_Type,
    SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Customer_Type;
```

This was used to compare the total quantity associated with guest and registered customers.

---

## Q9. Top Countries by Revenue

```sql
SELECT
    Country,
    SUM(Quantity * Price) AS revenue
FROM retail_data
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;
```

Top countries:

* United Kingdom
* EIRE
* Netherlands
* Germany
* France

The United Kingdom generated most of the revenue.

---

## Q10. Top Countries by Transaction Count

```sql
SELECT
    Country,
    COUNT(*) AS transaction_count
FROM retail_data
GROUP BY Country
ORDER BY transaction_count DESC
LIMIT 10;
```

The United Kingdom has the highest transaction count by a large margin.

---

## Q11. Average Transaction Value by Country

```sql
SELECT
    Country,
    AVG(Quantity * Price) AS avg_transaction_value
FROM retail_data
GROUP BY Country
ORDER BY avg_transaction_value DESC
LIMIT 10;
```

This gives a different view from total revenue because it looks at the average value of each transaction.

---

## Q12. Top Countries by Quantity

```sql
SELECT
    Country,
    SUM(Quantity) AS total_quantity
FROM retail_data
GROUP BY Country
ORDER BY total_quantity DESC
LIMIT 10;
```

The United Kingdom has the highest total quantity.

---

## Q13. Countries with Most Returns

```sql
SELECT
    Country,
    COUNT(*) AS return_transactions
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY return_transactions DESC
LIMIT 10;
```

The United Kingdom has the highest number of return transactions.

---

## Q14. Returned Quantity by Country

```sql
SELECT
    Country,
    SUM(Quantity) AS returned_quantity
FROM retail_data
WHERE Transaction_Type = 'Returns'
GROUP BY Country
ORDER BY returned_quantity ASC
LIMIT 10;
```

Returned quantities are negative in the dataset, so the countries with the most returned units appear first.

---

## Q15. Return Rate by Country

```sql
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
```

Some results:

* United Kingdom: 2.07%
* EIRE: 2.86%
* Germany: 5.23%
* France: 2.71%
* Netherlands: 0.91%
* Spain: 2.40%
* Switzerland: 1.63%
* Belgium: 1.73%
* Portugal: 2.22%
* Australia: 5.13%

The minimum transaction filter was added because countries with very few transactions can have unusually high return percentages that are not very useful for comparison.

---

## Main Findings So Far

* Total net revenue is around 19.23 million.
* Registered customers generated more revenue than guest customers.
* The majority of transactions are sales.
* Returns and adjustments reduce the final revenue.
* The United Kingdom is the main market in terms of revenue, quantity and transaction volume.
* A few countries account for a large part of the overall revenue.
* Return rate is different from return volume, so both need to be considered separately.

---

## Next

Customer-level analysis will be used to find the highest-value customers.

After that:

* Product analysis
* Monthly analysis
* Final business insights
* SQL project documentation

## CUSTOMER LEVEL ANALYSIS

## Customer Analysis

### Q16. Top 10 Customers by Revenue

```sql
SELECT customer_id,SUM(Quantity*Price) AS revenue
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;
```

Shows the customers who generated the highest revenue.

### Q17. Top 10 Customers by Total Quantity

```sql
SELECT customer_id,SUM(Quantity) AS total_quantity
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY total_quantity DESC
LIMIT 10;
```

Shows the customers who purchased the highest number of units.

### Q18. Top 10 Customers by Transaction Count

```sql
SELECT customer_id,COUNT(*) AS transaction_count
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY transaction_count DESC
LIMIT 10;
```

Shows the customers with the highest number of transactions.

### Q19. Average Transaction Value by Customer

```sql
SELECT customer_id,AVG(Quantity*Price) AS avg_transaction_value
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY avg_transaction_value DESC
LIMIT 10;
```

Shows customers with the highest average transaction value.

### Q20. High-Value and Frequent Customers

```sql
SELECT customer_id,COUNT(*) AS transaction_count,SUM(Quantity*Price) AS revenue
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
HAVING COUNT(*)>=500
ORDER BY revenue DESC
LIMIT 10;
```

Used a minimum of 500 transactions to focus on customers with enough transaction history.

### Q21. Top 10 Customers by Return Transactions

```sql
SELECT customer_id,COUNT(*) AS return_transactions
FROM retail_data
WHERE customer_id IS NOT NULL
AND Transaction_Type='Returns'
GROUP BY customer_id
ORDER BY return_transactions DESC
LIMIT 10;
```

Shows the customers with the highest number of return transactions.

### Q22. Customer Return Rate

```sql
SELECT customer_id,COUNT(*) AS total_transactions,
SUM(CASE WHEN Transaction_Type='Returns' THEN 1 ELSE 0 END) AS return_transactions,
ROUND(SUM(CASE WHEN Transaction_Type='Returns' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS return_rate
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
HAVING COUNT(*)>=20
ORDER BY return_rate DESC
LIMIT 10;
```

Customers with fewer than 20 transactions were excluded so that very small transaction histories do not distort the return rate.
## Product Analysis

### Q23. Top 10 Products by Revenue

```sql
SELECT Description,SUM(Quantity*Price) AS revenue
FROM products_df
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;
```

This shows the products that generated the highest revenue.

### Q24. Top 10 Products by Quantity Sold

```sql
SELECT Description,SUM(Quantity) AS total_quantity
FROM products_df
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;
```

This shows the products with the highest total quantity sold.

### Q25. Top 10 Products by Transaction Count

```sql
SELECT Description,COUNT(*) AS transaction_count
FROM products_df
GROUP BY Description
ORDER BY transaction_count DESC
LIMIT 10;
```

This shows the products that appeared in the highest number of transactions.

### Q26. Average Selling Price by Product

```sql
SELECT Description,AVG(Price) AS avg_price
FROM products_df
GROUP BY Description
ORDER BY avg_price DESC
LIMIT 10;
```

This shows the products with the highest average selling price.

### Q27. Products with the Highest Return Quantity

```sql
SELECT Description,SUM(Quantity) AS returned_quantity
FROM products_df
WHERE Transaction_Type='Returns'
GROUP BY Description
ORDER BY returned_quantity ASC
LIMIT 10;
```

Returned quantities are negative in the dataset, so ascending order shows the products with the largest number of returned units.

### Q28. Products with the Highest Net Revenue Loss

```sql
SELECT Description,SUM(Quantity*Price) AS revenue
FROM products_df
GROUP BY Description
HAVING revenue<0
ORDER BY revenue ASC
LIMIT 10;

```
This identifies products where the value of returns is greater than the revenue generated from sales.

### Q29. Top Products by Revenue and Quantity
```sql
SELECT Description,SUM(Quantity) AS total_quantity,SUM(Quantity*Price) AS revenue
FROM products_df GROUP BY Description ORDER BY revenue DESC LIMIT 10;

```
This combines quantity sold and revenue to see which products have strong overall sales performance.

### Q30. Monthly Revenue
```sql
SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
SUM(Quantity*Price) AS Revenue
FROM retail_data
WHERE Transaction_Type = "Sale"
Group By month
Order By month;

```
This shows the Monthly Revenue which is used for seeing which month got Highest 
and Lowest.

### Q31. Monthly Transaction Counts

```sql
SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
COUNT(*) AS transaction_count
FROM retail_data
GROUP BY month
ORDER BY month;

``` 
This Identifies how many transactions are taking place in each month and can Identity which one possesses Highest and Lowest Transactions Monthly.

### Q32. Montly Quantity
```sql
SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
SUM(Quantity) AS total_quantity
FROM retail_data
WHERE Transaction_Type='Sale'
GROUP BY month
ORDER BY month;

```
It generates the total quantity i.e., no.of units for every month

### Q33. Average Monthly Revenue

```sql
SELECT DATE_FORMAT(InvoiceDate,'%Y-%m') AS month,
ROUND(AVG(Quantity*Price),2) AS avg_revenue
FROM retail_data
WHERE Transaction_Type = "Sale"
Group By month
Order By month;

``` 
It shows the Average revenue generated for each months

### Q34. Monthly Return Analysis

```sql
SELECT DTAE_FORMAT(InvoiceDate,'%Y-%m') AS month,
COUNT(*) AS return_count,
SUM(Quantity) AS Return_Quantity,
SUM(Quantity * Price) AS return_revenue
FROM retail_data
WHERE Transaction_Type = "Returns"
GROUP BY month
ORDER BY month

```
This Identifies returned quantity, return revenue and returned no.of units
