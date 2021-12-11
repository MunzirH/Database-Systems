--Question 3
SELECT w.day_of_week AS day_of_week,
AVG(f.arrival_delay) AS delay
FROM flights AS f,
weekdays AS w
WHERE f.day_of_week_id = w.did
GROUP BY f.day_of_week_id
ORDER BY delay DESC 
LIMIT 1;