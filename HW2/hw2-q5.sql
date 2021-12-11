--Question 5
SELECT DISTINCT c.name AS name,
SUM(f.canceled)*100.0/COUNT(*) AS percentage
FROM flights AS f, carriers AS c 
WHERE f.origin_city = "Seattle WA"
AND f.carrier_id = c.cid
GROUP BY c.name
HAVING percentage > 0.5
ORDER BY percentage ASC;