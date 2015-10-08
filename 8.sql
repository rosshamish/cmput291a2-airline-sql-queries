prompt Question 8 - rhanders

select af.flightno, af.fare, af.seats, af.price
from available_flights af
where to_char(af.dep_date, 'Mon DD, YYYY') = 'Dec 22, 2015' and
      af.src = 'YEG' and
      af.dst = 'YYZ'
order by af.price asc;
