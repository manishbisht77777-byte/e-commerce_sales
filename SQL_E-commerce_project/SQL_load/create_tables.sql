-- Create table
CREATE TABLE ecommerce_sales (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(20),
    city VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    quantity INTEGER,
    unit_price DECIMAL(10,2),
    discount DECIMAL(10,2),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    payment_mode VARCHAR(50)
);