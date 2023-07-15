select ceil(avg(salary)-avg(zero))
from employees a,
    (select id, to_number(replace(to_char(salary),'0','')) zero
     from employees) b
where a.id=b.id;
