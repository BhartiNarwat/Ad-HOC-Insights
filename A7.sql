
SELECT 
 concat(monthname(S.date),'(',year(S.date),')') as month, S.fiscal_year, 
 ROUND(SUM(G.gross_price*S.sold_quantity),2) AS gross_sales_amount
FROM dim_customer C 
JOIN fact_sales_monthly S ON C.customer_code=S.customer_code
JOIN fact_gross_price G ON S.product_code=G.product_code 
WHERE C.customer='Atliq Exclusive'
GROUP BY month,S.fiscal_year
ORDER BY S.fiscal_year
;

