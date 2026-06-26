-- Q31. Which payment method is used most frequently?

SELECT
    payment_mode,
    count(payment_mode) as total_times
FROM ecommerce_sales
GROUP BY payment_mode
ORDER BY total_times DESC;

-- Q32. Which payment method has the highest average order value?

SELECT 
    payment_mode,
    ROUND(SUM(sales)::numeric, 2) as total_sales,
    COUNT(*) as total_orders,
    ROUND((SUM(sales) / COUNT(*))::numeric, 2) as avg_order_value
FROM ecommerce_sales
GROUP BY payment_mode
ORDER BY avg_order_value DESC
LIMIT 5;

-- Q33. Does payment method preference vary by region?

SELECT
    region,
    payment_mode,
    COUNT(*) as usage_count
FROM ecommerce_sales
GROUP BY region, payment_mode
ORDER BY region, usage_count DESC;


-- Q34. Which payment method generates the most profit?


SELECT  
    payment_mode,
    ROUND(SUM(sales)::numeric, 2) as total_revenue,
    ROUND(SUM(profit)::numeric, 2) as total_profit
FROM ecommerce_sales
GROUP BY payment_mode
ORDER BY total_profit DESC;