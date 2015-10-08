prompt Question 10 - rhanders

SELECT flightno1, flightno2, layover*24 as layover_h, price
FROM
(
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
            to_char(null) as flightno2,
            to_number(null) as layover,
            af.price
    FROM available_flights af
    WHERE af.src = 'YEG' AND
          af.dst = 'LAX' AND
          to_char(af.dep_date, 'Mon DD, YYYY') = 'Dec 22, 2015'
  )
)
WHERE ROWNUM <= 5
ORDER BY price ASC;
