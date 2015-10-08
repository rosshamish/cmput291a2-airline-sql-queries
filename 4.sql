prompt Question 4 - rhanders

SELECT a.acode, COUNT(sf.flightno) as num_arrivals
FROM airports a, flights f, sch_flights sf
WHERE a.acode = f.dst AND
      f.flightno = sf.flightno
GROUP BY a.acode
ORDER BY num_arrivals DESC;
