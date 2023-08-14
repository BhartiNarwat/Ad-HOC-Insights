
SELECT 
 segment,count(distinct product_code) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY count(distinct product_code) desc;
