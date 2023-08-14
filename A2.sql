
## STEP1- Get distinct products grouped by Year
WITH PROD AS
(SELECT S.fiscal_year,COUNT(DISTINCT P.product_code) AS products
 FROM  dim_product P
JOIN fact_sales_monthly S
ON P.product_code=S.product_code
GROUP BY S.fiscal_year)

## STEP2- Generate the final result 
SELECT 
(SELECT products FROM PROD WHERE fiscal_year='2020') AS unique_products_2020,
(SELECT products FROM PROD WHERE fiscal_year='2021') AS unique_products_2021,
ROUND(((SELECT products FROM PROD WHERE fiscal_year='2021')-(SELECT products FROM PROD WHERE fiscal_year='2020'))/
(SELECT PRODUCTS FROM PROD WHERE fiscal_year='2021')*100,2) 
AS percentage_chg
 FROM PROD
 LIMIT 1;
 
