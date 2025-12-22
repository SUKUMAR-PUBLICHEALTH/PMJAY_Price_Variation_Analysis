-- PM-JAY vs Private Cardiac Package Price Comparison

SELECT
    procedure_name,
    MAX(CASE WHEN group_type = 'PM- JAY (INR)' THEN average_price END) AS pmjay_price,
    MAX(CASE WHEN group_type = 'PRIVATE' THEN average_price END) AS private_price,
    MAX(CASE WHEN group_type = 'PRIVATE' THEN average_price END) -
    MAX(CASE WHEN group_type = 'PM- JAY (INR)' THEN average_price END) AS price_gap,
    ROUND(
        MAX(CASE WHEN group_type = 'PRIVATE' THEN average_price END) /
        MAX(CASE WHEN group_type = 'PM- JAY (INR)' THEN average_price END), 2
    ) AS price_ratio
FROM cardiac_price_comparison
GROUP BY procedure_name
ORDER BY price_gap DESC;