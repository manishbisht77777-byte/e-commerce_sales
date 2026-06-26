-- Q35. Which products are often bought together? 
-- *Find product pairs that appear in same order*

SELECT 
    a.product_name as product_1,
    b.product_name as product_2,
    COUNT(*) as times_bought_together
FROM ecommerce_sales a
INNER JOIN ecommerce_sales b
    ON a.order_id = b.order_id 
    AND a.product_name < b.product_name
WHERE a.product_name IS NOT NULL 
    AND b.product_name IS NOT NULL
GROUP BY a.product_name, b.product_name
ORDER BY times_bought_together DESC
LIMIT 10;
      
    
-- Q36. What is the month-over-month sales growth rate for the last 6 months?


WITH monthly_sales AS(
    SELECT
        Date_trunc('month', order_date) as month,
        sum(sales) as monthly_sales
    FROM ecommerce_sales
    GROUP BY Date_trunc('month', order_date) 
    )

SELECT 
    To_char(month ,'YYYY-MM') as month,
    ROUND(monthly_sales:: numeric,2) as present_month_sales,
    ROUND(LAG(monthly_sales) OVER (ORDER BY month)::numeric, 2) as previous_month_sales,
    ROUND(((monthly_sales - LAG(monthly_sales) OVER (ORDER BY month)) / 
          NULLIF(LAG(monthly_sales) OVER (ORDER BY month), 0) * 100)::numeric, 2) as growth_percent
FROM monthly_sales
ORDER BY month DESC
LIMIT 6;

-- Q37. Identify customers who have increased their spending over time.

WITH customer_first_last AS (
    SELECT 
        customer_name,
        MIN(order_date) as first_order_date,
        MAX(order_date) as last_order_date,
        (SELECT sales FROM ecommerce_sales e2 
         WHERE e2.customer_name = e1.customer_name 
         AND e2.order_date = MIN(e1.order_date)) as first_order_amount,
        (SELECT sales FROM ecommerce_sales e2 
         WHERE e2.customer_name = e1.customer_name 
         AND e2.order_date = MAX(e1.order_date)) as last_order_amount
    FROM ecommerce_sales e1
    GROUP BY customer_name
)
SELECT 
    customer_name,
    ROUND(first_order_amount::numeric, 2) as first_order_amount,
    ROUND(last_order_amount::numeric, 2) as last_order_amount,
    ROUND((last_order_amount - first_order_amount)::numeric, 2) as increase_amount,
    ROUND(((last_order_amount - first_order_amount) / NULLIF(first_order_amount, 0) * 100)::numeric, 2) as increase_percent
FROM customer_first_last
WHERE last_order_amount > first_order_amount  -- Increased spending!
ORDER BY increase_percent DESC;
