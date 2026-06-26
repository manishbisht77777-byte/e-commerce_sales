-- 21. Who are the top 10 customers by total spending?

SELECT 
    customer_name,
    round(sum(sales):: numeric, 2) as total_spending
FROM ecommerce_sales
GROUP BY customer_name
ORDER BY total_spending DESC
LIMIT 10;


-- 22. How many customers have made only 1 purchase vs multiple purchases?

WITH customer_orders AS
    (SELECT 
        customer_name,
        count(*) as purchase_count
    FROM ecommerce_sales
    GROUP BY customer_name
    )

SELECT 
    CASE
        WHEN purchase_count = 1 THEN 'One time'
        ELSE 'Repeat'
    END as customer_type,
    count(*) as number_of_customers
FROM customer_orders
GROUP BY customer_type;



-- 23. What is the average number of orders per customer?

SELECT 
    round(count(*)/count(DISTINCT customer_name):: numeric, 2) as average_number_of_orders
FROM ecommerce_sales;




-- 24. Which customers haven't ordered in the last 90 days? 
-- Assume today's date is 2025-12-31


    
WITH customer_last_order as(
    SELECT 
    customer_name,
    max(order_date) as last_order_date,
    date '2025-12-31' - max(order_date) as days_since_last_order
from ecommerce_sales
GROUp BY customer_name
) 

SELECT 
    customer_name,
    last_order_date,
    days_since_last_order
from customer_last_order
WHERE days_since_last_order > 90
ORDER BY days_since_last_order DESC;



-- 25. What percentage of total revenue comes from the top 10% of customers?

WITH customer_spending AS (
    SELECT 
        customer_name,
        SUM(sales) as total_spent
    FROM ecommerce_sales
    GROUP BY customer_name
),
ranked_customers AS (
    SELECT 
        customer_name,
        total_spent,
        PERCENT_RANK() OVER (ORDER BY total_spent DESC) as percentile_rank
    FROM customer_spending
)
SELECT 
    ROUND(SUM(total_spent)::numeric, 2) as top_10_percent_revenue
FROM ranked_customers
WHERE percentile_rank <= 0.10;