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

