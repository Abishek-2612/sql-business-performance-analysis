-- Revenue by Product
SELECT
    product_id,
    product_name,
    SUM(revenue) AS total_revenue
FROM base_orders
GROUP BY product_id, product_name
ORDER BY total_revenue DESC;



-- Best-Selling Products by Quantity
SELECT
    product_id,
    product_name,
    SUM(quantity) AS total_units_sold
FROM base_orders
GROUP BY product_id, product_name
ORDER BY total_units_sold DESC;



-- Revenue by Category
SELECT
    category,
    SUM(revenue) AS category_revenue
FROM base_orders
GROUP BY category
ORDER BY category_revenue DESC;



-- Category Contribution Percentage
SELECT
    category,
    SUM(revenue) AS category_revenue,
    ROUND(
        100.0 * SUM(revenue) / SUM(SUM(revenue)) OVER (),
        2
    ) AS revenue_percentage
FROM base_orders
GROUP BY category
ORDER BY revenue_percentage DESC;



-- Category Performance Summary
SELECT
    category,
    COUNT(DISTINCT product_id) AS total_products,
    SUM(quantity) AS total_units_sold,
    SUM(revenue) AS total_revenue,
    ROUND(AVG(revenue), 2) AS avg_revenue_per_row
FROM base_orders
GROUP BY category
ORDER BY total_revenue DESC;
