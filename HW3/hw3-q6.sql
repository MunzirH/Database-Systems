SELECT C.name AS carrier
FROM Carriers AS c, (SELECT f.carrier_id AS id
                      FROM Flights AS f
                      WHERE f.origin_city = 'Seattle WA'
                      AND f.dest_city = 'San Francisco CA') AS f
WHERE c.cid = f.id
GROUP BY c.name
ORDER BY c.name ASC;

--IT TOOK 5s TO RUN
/*carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America*/
--OUTPUT IS 4 ROWS