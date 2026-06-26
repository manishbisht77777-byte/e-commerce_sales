-- Q26. Which region has the highest total sales? 

SELECT
    region,
    round((sum(sales))::numeric,2) as total_sales
FROM ecommerce_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Q27. Which region has the highest profit margin?


SELECT  
    region,
    ROUND(SUM(sales)::numeric, 2) as total_revenue,
    ROUND(SUM(profit)::numeric, 2) as total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0) * 100)::numeric, 2) as profit_margin_percent
FROM ecommerce_sales
GROUP BY region
ORDER BY profit_margin_percent DESC;


-- Q28. Which are the top 5 cities by sales?

SELECT
    city,
    ROUND(SUM(sales)::numeric, 2) as total_sales
FROM ecommerce_sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;


-- Q29. Which city has the highest average order value?


SELECT 
    city,
    ROUND(SUM(sales)::numeric, 2) as total_sales,
    COUNT(*) as total_orders,
    ROUND((SUM(sales) / COUNT(*))::numeric, 2) as avg_order_value
FROM ecommerce_sales
GROUP BY city
ORDER BY avg_order_value DESC
LIMIT 5;

-- Q30. Which cities are underperforming (making a loss)?


SELECT 
    city,
    round(sum(profit)::numeric, 2) as total_profit
FROM ecommerce_sales
GROUP BY city
HAVING sum(profit) < 0
ORDER BY total_profit ASC;
