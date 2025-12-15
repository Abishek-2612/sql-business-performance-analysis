SELECT *
FROM (
    SELECT
        product_id,
        product_name,
        total_revenue,
        cumulative_revenue,
        ROUND(
            100.0 * cumulative_revenue / total_company_revenue,
            2
        ) AS cumulative_percentage
    FROM (
        SELECT
            product_id,
            product_name,
            SUM(revenue) AS total_revenue,
            SUM(SUM(revenue)) OVER (
                ORDER BY SUM(revenue) DESC
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) AS cumulative_revenue,
            SUM(SUM(revenue)) OVER () AS total_company_revenue
        FROM base_orders
        GROUP BY product_id, product_name
    ) t1
) t2
WHERE cumulative_percentage <= 80
ORDER BY total_revenue DESC;
