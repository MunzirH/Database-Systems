SELECT DISTINCT f.origin_city AS city
FROM Flights AS f
WHERE f.origin_city NOT IN (SELECT DISTINCT f1.dest_city AS city
FROM FLIGHTS AS f1, FLIGHTS AS f2
WHERE f2.dest_city = f1.origin_city
AND f2.origin_city = 'Seattle WA')
AND f.origin_city NOT IN (SELECT DISTINCT f4.dest_city AS city
FROM FLIGHTS AS f4
WHERE f4.origin_city = 'Seattle WA')
ORDER BY f.origin_city ASC;

--IT TOOK 224s TO RUN
/*city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
Victoria TX*/
--THE OUTPUT IS 4 ROWS