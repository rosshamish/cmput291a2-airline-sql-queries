prompt Question 7 - rhanders

CREATE VIEW available_flights AS
SELECT  f.flightno, sf.dep_date,
        f.src, f.dst, f.dep_time,
        (f.dep_time+f.est_dur+(b.tzone-a.tzone)) as arr_time,
        fr.fare,
        1 as seats,--(fr.limit-(SELECT COUNT(1) FROM b)) as seats,
        fr.price
FROM  flights f, sch_flights sf, flight_fares fr,
      airports a, airports b, bookings b
WHERE f.flightno = sf.flightno AND
      f.flightno = fr.flightno AND
      f.flightno = b.flightno AND
      a.acode = f.src AND
      b.acode = f.dst
HAVING seats > 1;
