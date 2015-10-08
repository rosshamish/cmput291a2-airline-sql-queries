prompt Question 7 - rhanders

CREATE VIEW available_flights AS
SELECT  f.flightno, sf.dep_date,
        f.src, f.dst, f.dep_time,
        (f.dep_time+f.est_dur+(b.tzone-a.tzone) as arr_time,
        fare, seats, price
FROM flights f, sch_flights sf, airports a, airports b
WHERE f.flightno = sf.flightno AND
      arr_times.flightno = f.flightno AND
      a.acode = f.src AND
      b.acode = f.dst

