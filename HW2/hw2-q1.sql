--Question 1
SELECT DISTINCT flight_num FROM flights AS f,
carriers AS c, weekdays AS w
WHERE f.carrier_id = c.cid AND
f.day_of_week_id = w.did AND
f.origin_city = "Seattle WA" AND
f.dest_city = "Boston MA" AND
c.name = "Alaska Airlines Inc." AND
w.day_of_week = "Monday";