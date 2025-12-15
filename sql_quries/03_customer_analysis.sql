-- Orders per Customer
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM base_orders
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC;



-- Repeat vs One-Time Customers
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM base_orders
    GROUP BY customer_id
) t
GROUP BY customer_type;



-- Repeat Customer Percentage
SELECT
    ROUND(
        100.0 *
        COUNT(CASE WHEN total_orders > 1 THEN 1 END) / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM base_orders
    GROUP BY customer_id
) t;



-- Customer Lifetime Value (CLV)
SELECT
    customer_id,
    customer_name,
    SUM(revenue) AS customer_lifetime_value
FROM base_orders
GROUP BY customer_id, customer_name
ORDER BY customer_lifetime_value DESC;



-- Average Revenue per Customer
SELECT
    AVG(customer_revenue) AS avg_revenue_per_customer
FROM (
    SELECT
        customer_id,
        SUM(revenue) AS customer_revenue
    FROM base_orders
    GROUP BY customer_id
) t;



-- Customer Segmentation using NTILE
SELECT
    customer_id,
    customer_name,
    customer_revenue,
    CASE
        WHEN revenue_bucket >= 4 THEN 'VIP Customer'
        WHEN revenue_bucket >= 2 THEN 'Regular Customer'
        ELSE 'Low Value Customer'
    END AS customer_segment
FROM (
    SELECT
        customer_id,
        customer_name,
        SUM(revenue) AS customer_revenue,
        NTILE(5) OVER (ORDER BY SUM(revenue)) AS revenue_bucket
    FROM base_orders
    GROUP BY customer_id, customer_name
) t
ORDER BY customer_revenue DESC;
