SELECT DISTINCT C.name AS carrier
FROM Carriers AS c, Flights AS f
WHERE c.cid = f.carrier_id
AND f.origin_city = 'Seattle WA'
AND f.dest_city = 'San Francisco CA'
GROUP BY c.name
ORDER BY c.name ASC;

--IT TOOK 6s TO RUN
/* carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America*/
--OUT IS 4 ROWS