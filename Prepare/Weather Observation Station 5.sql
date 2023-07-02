select min(city), length(min(city))
from station
where length(city) in (select min(length(city))
                   from station)
union
select min(city), length(min(city))
from station
where length(city) in (select max(length(city))
                   from station);
