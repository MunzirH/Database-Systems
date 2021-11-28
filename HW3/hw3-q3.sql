SELECT f2.origin_city AS origin_city, ISNULL(cast((SELECT count(*) AS number
                                            FROM FLIGHTS AS f1
                                            WHERE f1.actual_time < 180
                                            AND f1.origin_city = f2.origin_city
                                            GROUP BY f1.origin_city) AS FLOAT) * 100.0 /count(*),0) AS percentage 
FROM FLIGHTS AS f2
GROUP BY f2.origin_city
ORDER BY percentage ASC;

--It took 18s to run
/*
origin_city	percentage
Guam TT	0
Pago Pago TT	0
Aguadilla PR	29.4339622641509
Anchorage AK	32.1460373998219
San Juan PR	33.890360709191
Charlotte Amalie VI	40
Ponce PR	41.9354838709677
Fairbanks AK	50.6912442396313
Kahului HI	53.664998528113
Honolulu HI	54.9088086922778
San Francisco CA	56.3076568265683
Los Angeles CA	56.6041076487252
Seattle WA	57.7554165533497
Long Beach CA	62.4541164132145
Kona HI	63.2821075740944
New York NY	63.481519772551
Las Vegas NV	65.163009288384
Christiansted VI	65.3333333333333
Newark NJ	67.1373555840822
Worcester MA	67.741935483871
*/
--returns 327 rows