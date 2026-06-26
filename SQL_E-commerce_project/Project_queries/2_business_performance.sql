-- 6. What is the monthly sales trend? (Show month and total sales)

SELECT 
    date_trunc('month', order_date) as month,
    round(sum(sales)::numeric, 2) as total_sales
FROM ecommerce_sales
GROUP BY month
ORDER BY month;




-- 7. Which month had the highest sales?

SELECT 
    date_trunc('month', order_date) as month,
    round(sum(sales)::numeric, 2) as total_sales
FROM ecommerce_sales
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;




-- 8. How do sales compare between 2024 and 2025? (Show total sales for each year)


SELECT 
    EXTRACT(YEAR FROM order_date) as year,
    ROUND(SUM(sales)::numeric, 2) as total_sales
FROM ecommerce_sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;



-- 9. What is the average order value overall, and by region?

SELECT 
    region,
    round(sum(sales):: numeric,2) as total_values,
     COUNT(DISTINCT order_id) as total_orders,
    round(round(sum(sales) /  COUNT(DISTINCT order_id))) as average_order_value
FROM ecommerce_sales
GROUP BY region
ORDER BY average_order_value DESC;


-- 10. Which quarter of the year generates the most revenue?


SELECT 
    DATE_TRUNC('quarter', order_date) as quarter,
    ROUND(SUM(sales)::numeric, 2) as total_revenue
FROM ecommerce_sales
GROUP BY DATE_TRUNC('quarter', order_date)
ORDER BY quarter;