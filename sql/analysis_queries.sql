-- Invoices per Country
-- Find countries whose average invoice amount
-- is greater than the overall average invoice amount.

SELECT
    co.country_name,
    COUNT(i.id) AS total_invoices,
    ROUND(AVG(i.total_price), 6) AS average_amount
FROM country co
JOIN city ci
    ON ci.country_id = co.id
JOIN customer c
    ON c.city_id = ci.id
JOIN invoice i
    ON i.customer_id = c.id
GROUP BY co.id, co.country_name
HAVING AVG(i.total_price) > (
    SELECT AVG(total_price)
    FROM invoice
);