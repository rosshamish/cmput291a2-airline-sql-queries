prompt Question 9 - rhanders

create view good_conections as
select * from
(
  SELECT af1.src, af2.dst,
         af1.dep_date,
         af1.flightno as flightno1,
         af2.flightno as flightno2,
         to_date(af1.arr_time,'HH24:MI:SS')/(24*60)
           - to_date(af2.dep_time,'HH24:MI:SS')/(24*60) as layover,
         af1.price+af2.price as price
  from available_flights af1, available_flights af2
  where af1.dst = af2.src
)
where layover > 90 and
      layover < (5*60);
