select c.company_code, founder,
    count(distinct l.lead_manager_code),
    count(distinct s.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from company c left outer join lead_manager l on l.company_code=c.company_code
    left outer join senior_manager s on c.company_code=s.company_code
    left outer join manager m on s.company_code=m.company_code
    left outer join employee e on m.company_code=e.company_code
group by c.company_code, founder
order by c.company_code;
