

SELECT 	
 C.customer_code,C.customer,ROUND(avg(P.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM fact_pre_invoice_deductions P
JOIN dim_customer C
ON P.customer_code=C.customer_code
WHERE C.market='India' AND P.fiscal_year='2021'
GROUP BY C.customer_code,C.customer
ORDER BY ROUND(avg(P.pre_invoice_discount_pct),4) DESC
LIMIT 5;


