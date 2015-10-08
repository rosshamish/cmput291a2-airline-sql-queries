prompt Question 5 - rhanders

SELECT ROWNUM as rank, t.acode, t.num_arrivals_and_departures
FROM
(
  SELECT a.acode,
        (arrs.num + deps.num) as num_arrivals_and_departures
  FROM
    (
      SELECT a.acode, COUNT(sf.flightno) as num
      FROM airports a, flights f, sch_flights sf
      WHERE a.acode = f.dst AND
            f.flightno = sf.flightno
      GROUP BY a.acode
      ORDER BY num DESC
    ) arrs,
    (
      SELECT a.acode, COUNT(sf.flightno) as num
      FROM airports a, flights f, sch_flights sf
      WHERE a.acode = f.src AND
            f.flightno = sf.flightno
      GROUP BY a.acode
      ORDER BY num DESC
    ) deps,
    airports a
  WHERE arrs.acode = deps.acode AND
        a.acode = arrs.acode
  ORDER BY num_arrivals_and_departures DESC
) t
WHERE ROWNUM <= 3;
