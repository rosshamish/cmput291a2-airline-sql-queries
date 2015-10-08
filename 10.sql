prompt Question 10 - rhanders

SELECT * FROM
(
  SELECT  gc.flightno1,
          gc.flightno2,
          gc.layover,
          gc.price
  FROM good_connections gc
  WHERE gc.src = 'YEG' AND
        gc.dst = 'LAX' AND
        to_char(gc.dep_date, 'Mon DD, YYYY') = 'Dec 22, 2015'
)
UNION
(
  SELECT  af.flightno as flightno1,
          NULL as flightno2
          NULL as layover,
          af.price
  FROM available_flights af
  WHERE af.src = 'YEG' AND
        af.dst = 'LAX' AND
        to_char(af.dep_date, 'Mon DD, YYYY') = 'Dec 22, 2015'
)
ORDER BY price DESC;
WHERE ROWNUM <= 5;
