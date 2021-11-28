--Question 4
SELECT DISTINCT c.name AS name
FROM flights AS f,
carriers AS c
WHERE f.carrier_id = c.cid
GROUP BY c.name, f.month_id, f.day_of_month
HAVING count(c.name) > 1000;