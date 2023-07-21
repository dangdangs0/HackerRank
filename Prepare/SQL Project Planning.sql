select min(start_date) s, end_date
from (select connect_by_root start_date as start_date, end_date
    from projects
    where connect_by_isleaf=1
    start with prior end_date !=start_date
    connect by prior end_date=start_date)
group by end_date
order by end_date-s, s;
