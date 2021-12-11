SELECT DISTINCT f.origin_city AS city
FROM Flights AS f
WHERE f.origin_city NOT IN (SELECT f1.origin_city
                    FROM Flights AS f1
                    WHERE f1.actual_time >= 180)
ORDER BY f.origin_city;
--it took 31s to run
/*city
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Albuquerque NM
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Anchorage AK
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlanta GA
Atlantic City NJ*/
--109 rows