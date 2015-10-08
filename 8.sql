prompt Question 8 - rhanders

SELECT af.flightno, af.fare, af.seats af.price
FROM available_flights af
WHERE to_char(af.dep_date, 'Mon DD, YYYY' = 'Dec 22, 2015'
ORDER BY af.price DESC;
