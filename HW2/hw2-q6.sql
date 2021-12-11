--Question 6
SELECT DISTINCT c.name AS carrier, 
MAX(f.price) AS max_price
FROM flights AS f, carriers AS c
WHERE f.carrier_id = c.cid AND
((f.dest_city = "Seattle WA" AND f.origin_city = "New York NY") OR
(f.dest_city = "New York NY" AND f.origin_city = "Seattle WA"))
GROUP BY f.carrier_id;