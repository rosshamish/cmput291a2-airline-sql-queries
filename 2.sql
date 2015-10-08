prompt Question 2 - rhanders

SELECT DISTINCT p.name, t.email
FROM passengers p, tickets t, bookings b, flights f, sch_flights sf
WHERE p.email = t.email AND
      t.tno = b.tno AND
      b.flightno = f.flightno AND
      f.flightno = sf.flightno AND
      f.src = 'YEG' AND
      to_char(sf.dep_date, 'Mon') = 'Dec' AND
      to_char(sf.dep_date, 'YYYY') = '2015';
