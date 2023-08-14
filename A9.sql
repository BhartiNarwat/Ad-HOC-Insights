SELECT * FROM gdb023.dim_customer;

WITH SALES AS 
 (
  SELECT 
  C.channel,round(sum(G.gross_price*S.sold_quantity)/1000000,2) as gross_sales_mln
  FROM dim_customer C 
  JOIN fact_sales_monthly S ON C.customer_code=S.customer_code
  JOIN fact_gross_price G ON S.product_code=G.product_code AND S.fiscal_year=G.fiscal_year
  WHERE S.fiscal_year='2021'
  GROUP BY C.channel )
SELECT *,round((gross_sales_mln/(select sum(gross_sales_mln) from SALES))*100,2) AS percentage FROM SALES
ORDER BY percentage DESC LIMIT 1;
