
-- 11. Which category has the highest total sales?

SELECT 
    category,
    round(sum(sales):: numeric, 2) as total_sales
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC
LIMIT 1;


-- 12. Which category has the highest profit margin?

SELECT 
    category,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0) * 100 )::numeric, 2) as profit_margin_percent
FROM ecommerce_sales
GROUP BY category
ORDER BY profit_margin_percent DESC
LIMIT 1;


-- 13. What are the top 5 best-selling products by quantity sold?

SELECT 
    product_name,
    sum(quantity) as total_sold_products
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_sold_products DESC
LIMIT 5;


-- 14. What are the top 5 most profitable products?

-- SELECT 
    product_name,
    round(sum(profit)::numeric, 2) as total_profit
FROM ecommerce_sales
GROUP BY product_name
order by total_profit desc
LIMIT 5;

-- 15. Which products are making a loss (negative profit)?

SELECT 
    product_name,
    round(sum(profit)::numeric, 2) as total_profit
FROM ecommerce_sales
GROUP BY product_name
HAVING sum(profit) < 0
ORDER BY total_profit ASC;
