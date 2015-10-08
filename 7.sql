prompt Question 7 - rhanders

drop view available_flights;

create view available_flights as
select * from
(
  select  f.flightno, sf.dep_date,
          f.src, f.dst,
          to_char(f.dep_time, 'HH24:MI:SS') as dep_time,
          to_char(
            f.dep_time
            +f.est_dur/(24*60)
            +(b.tzone-a.tzone)/24,
          'HH24:MI:SS') as arr_time,
          fr.fare,
          fr.limit-(select count(1) from bookings where
                    bookings.flightno = f.flightno and
                    bookings.flightno = sf.flightno and
                    bookings.flightno = fr.flightno) as seats,
          fr.price
  from  flights f, sch_flights sf, flight_fares fr,
        airports a, airports b
  where f.flightno = sf.flightno and
        f.flightno = fr.flightno and
        a.acode = f.src and
        b.acode = f.dst and
        a.acode != b.acode
) t
where seats > 0;
