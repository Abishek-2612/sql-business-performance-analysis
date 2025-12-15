-- Total Revenue
SELECT
    SUM(revenue) AS total_revenue
FROM base_orders;



-- Total Orders and Customers
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM base_orders;



-- Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM base_orders
GROUP BY 1
ORDER BY 1;



-- Month-over-Month Revenue Growth
SELECT
    month,
    monthly_revenue,
    monthly_revenue -
    LAG(monthly_revenue) OVER (ORDER BY month) AS revenue_growth
FROM (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(revenue) AS monthly_revenue
    FROM base_orders
    GROUP BY 1
) t;



-- Average Order Value (AOV)
SELECT
    AVG(order_value) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(revenue) AS order_value
    FROM base_orders
    GROUP BY order_id
) t;
