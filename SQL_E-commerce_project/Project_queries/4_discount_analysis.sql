-- 16. What is the average discount given across all orders?

-- SELECT
--     count(order_id) as total_orders,
--     round((sum(discount)):: numeric, 2) as total_discount,
--     (round((sum(discount)) :: numeric,2) / count(order_id)) as average_discount
-- FROM ecommerce_sales;


-- 17. How does average profit change with discount level? 
-- Group discounts into: No discount, 1-10%, 11-20%, 20%+

-- SELECT 
--     CASE
--         WHEN discount = 0 THEN 'No discount'
--         WHEN discount <= 10 THEN '1-10%'
--         WHEN discount <= 20 THEN '11-20%'
--         ELSE '20%+'
--     END as discount_level,
--     round((sum(profit)):: numeric,2) as total_profit,
--     count(*) as total_product_number,
--     round((avg(profit)):: numeric,2) as average_profit
-- FROM ecommerce_sales
-- GROUP BY discount_level
-- ORDER BY discount_level;

-- 18. Which category receives the highest average discount?

-- SELECT 
--     category,
--     count(*) as total_product_number,
--     round((avg(discount))::numeric,2) as average_discount
-- FROM ecommerce_sales
-- GROUP BY category
-- ORDER BY average_discount desc
-- LIMIT 10;




-- 19. Which product has the highest average discount?

-- SELECT 
--     product_name,
--     round((avg(discount)):: numeric,2) as average_discount
-- FROM ecommerce_sales
-- GROUP BY product_name
-- ORDER BY average_discount DESC
-- LIMIT 1;




-- 20. Do discounted orders have lower profit margins than non-discounted orders?

-- SELECT
--     CASE
--         WHEN discount = 0 THEN 'No Discount'
--         ELSE 'Discount'
--         END as discount_level,
--     count(order_id),
--     ROUND((SUM(profit))::numeric,2) as total_profit,
--     ROUND((SUM(profit) / NULLIF(SUM(sales), 0)*100)::numeric, 2) as profit_margin
-- FROM ecommerce_sales
-- GROUP BY discount_level
-- ORDER BY profit_margin DESC



