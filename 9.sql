prompt Question 9 - rhanders

drop view good_connections;

create view good_connections as
select * from
(
  SELECT af1.src, af2.dst,
         af1.dep_date,
         af1.flightno as flightno1,
         af2.flightno as flightno2,
         af2.dep_time - af1.arr_time as layover,
         af1.price+af2.price as price
  from available_flights af1, available_flights af2
  where af1.dst = af2.src
)
where layover*24*60 > 90 and
      layover*24 < 5;

-- select * from good_connections;
