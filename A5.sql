
### STEP 1- product having high manufacturing cost 
(SELECT
  P.product_code,P.product,ROUND(SUM(M.manufacturing_cost*S.sold_quantity),2) AS manufacturing_cost
FROM fact_manufacturing_cost M
JOIN dim_product P ON M.product_code=P.product_code
JOIN fact_sales_monthly S ON S.product_code=M.product_code AND S.fiscal_year=M.cost_year
GROUP BY P.product_code,P.product
ORDER BY SUM(M.manufacturing_cost*S.sold_quantity) DESC
LIMIT 1)
UNION 
### Step2- product having low manufacturing cost 
(SELECT 
 P.product_code,P.product,ROUND(SUM(M.manufacturing_cost*S.sold_quantity),2) AS manufacturing_cost
FROM fact_manufacturing_cost M
JOIN dim_product P ON M.product_code=P.product_code
JOIN fact_sales_monthly S ON S.product_code=M.product_code AND S.fiscal_year=M.cost_year
GROUP BY P.product_code,P.product
ORDER BY SUM(M.manufacturing_cost*S.sold_quantity) 
LIMIT 1);



