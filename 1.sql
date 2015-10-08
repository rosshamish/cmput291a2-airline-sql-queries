prompt Question 1 - rhanders

SELECT DISTINCT t.email
FROM tickets t, bookings b, flights f
WHERE t.tno = b.tno AND b.flightno = f.flightno AND f.dst = 'YEG';
