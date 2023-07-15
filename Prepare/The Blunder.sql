select round(avg(salary)-avg(zero))+1
from employees a,
    (select id, to_number(replace(to_char(salary),'0','')) zero
     from employees) b
where a.id=b.id;
