prompt Question 7 - rhanders

drop view available_flights;

create view available_flights as
select  f.flightno, sf.dep_date,
        f.src, f.dst,
        to_char(f.dep_time, 'HH24:MI:SS') as dep_time,
        to_char(
          f.dep_time
          +f.est_dur/(24*60)
          +(b.tzone-a.tzone)/24,
        'HH24:MI:SS') as arr_time,
        fr.fare,
        1 as seats,--(fr.limit-(SELECT COUNT(1) FROM b)) as seats,
        fr.price
from  flights f, sch_flights sf, flight_fares fr,
      airports a, airports b, bookings b
where f.flightno = sf.flightno and
      f.flightno = fr.flightno and
      f.flightno = b.flightno and
      a.acode = f.src and
      b.acode = f.dst and
      a.acode != b.acode;
--HAVING seats > 0;

select * from available_flights
where ROWNUM <= 200;
