# Python Analysis

## About this analysis

Python was used to analyze the Online Retail II dataset and understand sales, customers, products, returns, countries and monthly performance.

The analysis was mainly done using Pandas and NumPy. Matplotlib was also used for visualization.

## Dataset

The dataset contains two files/sheets:

* `yr 2009-2010`
* `year 2010-11`

After combining them, there were 1,067,371 rows.

Before the main analysis, duplicate records were checked and removed.

| Dataset   | Original Rows | Duplicates Removed | Rows Kept |
| --------- | ------------: | -----------------: | --------: |
| 2009-2010 |       525,462 |              6,865 |   518,596 |
| 2010-2011 |       541,910 |              5,268 |   536,642 |
| Total     |     1,067,371 |             12,133 | 1,055,238 |

## Initial data checking

I checked the following before starting the analysis:

* Shape of the dataset
* Column names
* Data types
* Missing values
* Duplicate rows
* Unique values
* Minimum and maximum values
* Basic statistics

The main columns used were:

`Invoice`, `Transaction_Type`, `StockCode`, `Description`, `Quantity`, `InvoiceDate`, `Price`, `Customer ID`, `Customer_Type`, and `Country`.

## Missing values

Customer ID had a large number of missing values.

There were 243,007 records without a Customer ID in the original data-quality check.

Instead of removing these transactions, I classified transactions into two customer types:

* Registered
* Guest

This allowed the transactions to still be used for overall sales analysis.

Some product descriptions were also missing.

## Transaction type

Invoices starting with `C` were treated as return/cancellation transactions.

The transaction counts were:

| Transaction Type |     Count |
| ---------------- | --------: |
| Sale             | 1,032,349 |
| Return           |    35,022 |

There were also 12,133 blank rows created by the original data structure after combining the datasets. These were investigated separately rather than treating them as normal transactions.

## Revenue

Revenue was calculated using:

```python
df["Revenue"] = df["Quantity"] * df["Price"]
```

Total revenue from the dataset was:

`19,231,800.518`

Returns have negative revenue because their quantities are negative.

## Quantity and return analysis

There were 22,889 transaction rows with negative quantities.

The total returned quantity was:

`1,061,934`

The largest negative quantity found was `-80,995`.

While checking this value, I found that it was connected to the same product and customer as a transaction with a quantity of `80,995`.

Because of this, extreme values were investigated instead of simply deleting them.

## Country analysis

Revenue, quantity, transaction count and return rate were compared between countries.

The top countries by revenue were:

| Country        |    Revenue |
| -------------- | ---------: |
| United Kingdom | 16,328,820 |
| EIRE           |    615,229 |
| Netherlands    |    548,523 |
| Germany        |    417,430 |
| France         |    327,997 |

The UK was significantly higher than the other countries in terms of revenue and transaction volume.

## Customer type analysis

Revenue was compared between Guest and Registered customers.

| Customer Type | Revenue |
| ------------- | ------: |
| Guest         |   2.64M |
| Registered    |  16.59M |

Average revenue per transaction was also calculated:

| Customer Type | Average Revenue |
| ------------- | --------------: |
| Guest         |           12.86 |
| Registered    |           22.28 |

Registered customer transactions generated most of the recorded revenue.

## Customer analysis

Revenue was grouped by Customer ID to find high-value customers.

Top 5 customers by revenue:

| Customer ID |    Revenue |
| ----------- | ---------: |
| 18102       | 598,215.22 |
| 14646       | 523,342.07 |
| 14156       | 296,378.14 |
| 14911       | 270,169.49 |
| 17450       | 233,419.39 |

## Product analysis

Product revenue and quantity were analyzed separately.

The analysis also showed that not every description in the dataset was an actual product.

Examples found during the analysis:

* Amazon Fee
* Bank Charges
* Manual
* Bad Debt
* CRUK Commission
* Samples
* Postage
* DOTCOM POSTAGE
* Adjustment transactions

These were not removed from the original dataframe because they can be useful for overall financial analysis.

For product-specific analysis, a separate `product_df` was created to exclude identified non-product transactions.

## Top products by revenue

The top 5 products by revenue were:

| Product                            |    Revenue |
| ---------------------------------- | ---------: |
| REGENCY CAKESTAND 3 TIER           | 327,345.20 |
| WHITE HANGING HEART T-LIGHT HOLDER | 257,192.70 |
| JUMBO BAG RED RETROSPOT            | 148,505.35 |
| PARTY BUNTING                      | 147,870.80 |
| ASSORTED COLOUR BIRD ORNAMENT      | 131,043.74 |

Product quantity was also analyzed.

During this analysis, I found that StockCode `21212` appeared with two slightly different descriptions:

* `PACK OF 72 RETROSPOT CAKE CASES`
* `PACK OF 72 RETRO SPOT CAKE CASES`

Both had the same StockCode, so this was noted as a data-cleaning issue instead of treating them as two completely different products.

## Return analysis

Returns were analyzed separately to understand which countries had more returned transactions.

The UK had the highest number of return transactions.

Some smaller countries had higher return percentages even though their transaction counts were very low. Because of this, return rate was considered together with the number of transactions rather than looking only at the percentage.

## Time analysis

`InvoiceDate` was converted to datetime and monthly revenue was calculated.

The highest recorded month was:

`November 2011 — 1,456,145.80`

The lowest recorded month was:

`December 2011 — 432,719.06`

December should be interpreted carefully because it is the final period in the available data.

## Other Pandas work

During the analysis I practiced:

* Filtering rows
* Multiple conditions
* `groupby()`
* `sum()`
* `mean()`
* `count()`
* `size()`
* `sort_values()`
* `value_counts()`
* `drop_duplicates()`
* `isin()`
* `pivot_table()`
* Date conversion
* Monthly grouping
* Ranking
* Boolean indexing
* NumPy calculations

## Main findings

1. The UK generated most of the revenue in the dataset, with about 16.33M in revenue.

2. Registered customer transactions generated much more revenue than guest transactions.

3. A small number of customers contributed a large amount of revenue. Customer 18102 generated about 598K.

4. A few products generated a significant amount of product revenue, with REGENCY CAKESTAND 3 TIER being the highest.

5. The dataset contains a considerable number of returns. The UK had the highest return transaction count.

6. November 2011 had the highest recorded monthly revenue.

7. The dataset contains financial and administrative transactions mixed with product transactions, so product analysis needs additional filtering.

## Conclusion

This analysis helped me practice using Python, Pandas and NumPy on a real-world dataset instead of using small sample datasets.

I worked through data checking, missing values, duplicates, transaction classification, revenue calculation, customer analysis, product analysis, return analysis, country analysis and monthly trends.

The final results were then used to identify business findings from the data.
