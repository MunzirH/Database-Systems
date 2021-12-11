SELECT DISTINCT f.dest_city AS city
FROM FLIGHTS AS f, FLIGHTS AS f1
WHERE f1.dest_city = f.origin_city
AND f1.origin_city = 'Seattle WA'
AND f.dest_city != 'Seattle WA'
AND f.dest_city NOT IN (SELECT DISTINCT f2.dest_city AS city
            FROM FLIGHTS AS f2
            WHERE f2.origin_city = 'Seattle WA')
ORDER BY f.dest_city ASC;

--IT TOOK 21s TO RUN
/*
city
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/
--THE OUTPUT IS 256 ROWS