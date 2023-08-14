
#### CREATE FISCAL_MONTH COLUMN ###
WITH TEMP_SALES AS 
(SELECT *,
CASE WHEN MONTH(DATE)>=9 THEN MONTH(DATE)-8 ELSE MONTH(DATE)+4 
END AS fiscal_month FROM fact_sales_monthly)

### CREATING QUARTERS ###
SELECT 
CASE WHEN fiscal_month BETWEEN 1 AND 3 THEN 'Q1'
WHEN fiscal_month BETWEEN 4 AND 6 THEN 'Q2'
WHEN fiscal_month BETWEEN 7 AND 9 THEN 'Q3'
ELSE 'Q4' 
END AS quarters,SUM(sold_quantity) AS total_sold_quantity FROM TEMP_SALES 
WHERE fiscal_year='2020'
GROUP BY quarters
ORDER BY SUM(sold_quantity);

