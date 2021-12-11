-- Answer = 1481

SELECT d_id, AVG(g_price)
FROM ggarments
GROUP BY d_id
ORDER BY AVG(g_price) DESC
LIMIT 1;