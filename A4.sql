SELECT * FROM gdb023.dim_product;

## STEP 1- Creating table by joining 
WITH PRODUCT AS
(SELECT S.fiscal_year,P.segment,COUNT(DISTINCT P.product_code) AS unique_products 
FROM dim_product P
JOIN fact_sales_monthly S ON P.product_code=S.product_code
GROUP BY P.segment,S.fiscal_year)
SELECT SEGMENT,
SUM(CASE WHEN fiscal_year='2020' THEN unique_products ELSE 0 END) AS product_count_2020 ,
sum(CASE WHEN fiscal_year='2021' THEN unique_products ELSE 0 END) AS product_count_2021,
(SUM(CASE WHEN fiscal_year='2021' THEN unique_products ELSE 0 END)-
SUM(CASE WHEN fiscal_year='2020' THEN unique_products ELSE 0 END)) AS difference
FROM product
GROUP BY segment;

