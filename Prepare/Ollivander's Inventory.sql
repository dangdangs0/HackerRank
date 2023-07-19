select id,age,coins_needed, power
from wands w, wands_property p
where w.code=p.code
and p.is_evil=0
and (w.code,coins_needed,power) in (select code, min(coins_needed),power
                                   from wands
                                   group by code, power)
order by power desc, age desc;
