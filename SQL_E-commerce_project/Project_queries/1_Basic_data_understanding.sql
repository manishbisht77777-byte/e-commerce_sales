
-- 1. How many total orders, total customers, and total products are in the dataset?

    SELECT 
        COUNT(order_id) as total_orders,
        COUNT(DISTINCT customer_name) as total_customers,
        COUNT(DISTINCT product_name) as total_products
    FROM ecommerce_sales;
        

-- 2.  What is the date range of the data (earliest and latest order)?

    SELECT
        MIN(order_date) as earliest_date,
        MAX(order_date) as latest_date
    FROM ecommerce_sales;
      
-- How many unique categories and sub-categories exist?

    SELECT 
        COUNT(DISTINCT category) as categories_count,
        COUNT(DISTINCT sub_category) as sub_categories_count
    FROM ecommerce_sales;

-- How many unique regions and cities are covered?
    SELECT 
        COUNT(DISTINCT region) as region_count,
        COUNT(DISTINCT city) as city_count
    FROM ecommerce_sales;

--What is the total revenue, total profit, and overall profit margin?

    SELECT  
        ROUND(SUM(sales)::numeric, 2) as total_revenue,
        ROUND(SUM(profit)::numeric, 2) as total_profit,
        ROUND((SUM(profit) / NULLIF(SUM(sales), 0) * 100)::numeric, 2) as profit_margin_percent
    FROM ecommerce_sales;


      
