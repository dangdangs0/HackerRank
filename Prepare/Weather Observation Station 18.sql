select round(abs(c-a)+abs(d-b),4)
from (select min(lat_n) a
     from station),
     (select min(long_w) b
     from station),
     (select max(lat_n) c
     from station),
     (select max(long_w) d
     from station);
