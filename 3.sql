prompt Question 3 - rhanders

-- flightno, dep_date for all flights
-- within the next 30 days
SELECT sf.flightno, sf.dep_date
FROM sch_flights sf
WHERE sf.dep_date - SYSDATE > 0 AND
      sf.dep_date - SYSDATE <= 30
MINUS
-- flightno, dep_date for all bookings
-- within the next 30 days
SELECT b.flightno, b.dep_date
FROM bookings b
WHERE b.dep_date - SYSDATE > 0 AND
      b.dep_date - SYSDATE <= 30;

