prompt Question 6 - rhanders

SELECT *
FROM
(
  SELECT f.flightno, f.dep_time, fr.fare as ft, fr.price
  FROM flights f, sch_flights sf, flight_fares fr
  WHERE f.flightno = sf.flightno AND
        sf.flightno = fr.flightno AND
        f.src = 'YEG' AND
        f.dst = 'LAX'
  ORDER BY fr.price
) t
WHERE ROWNUM = 1;
