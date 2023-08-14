
WITH PROD AS 
 (SELECT 
  P.division,P.product_code,P.product,sum(M.sold_quantity) AS total_sold_quantity,
  RANK() OVER (PARTITION BY P.division ORDER BY sum(M.sold_quantity) DESC) as rank_order 
  FROM dim_product P
  JOIN fact_sales_monthly M 
  ON P.product_code=M.product_code 
  WHERE fiscal_year='2021'
  GROUP BY P.division,P.product_code,P.product)
SELECT * FROM PROD WHERE PROD.rank_order<4;


